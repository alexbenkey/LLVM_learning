# LLVM Testing Toolchain Guide

This document explains how `lit` (LLVM Integrated Tester) and `FileCheck` work together in your project, and how to leverage their advanced features.

## Overview of the Toolchain

### 🔧 **lit (LLVM Integrated Tester)**
- **Purpose**: Test runner and orchestration framework
- **Role**: Discovers tests, runs commands, manages execution environment
- **Configuration**: `lit.cfg.py` defines how tests are found and executed

### 🔍 **FileCheck**
- **Purpose**: Output verification tool
- **Role**: Matches patterns in program output against expected patterns
- **Strength**: Flexible pattern matching with variables, regex, and control flow

### 🏗️ **Tool Substitutions**
Your `lit.cfg.py` maps `%tool` placeholders to actual binaries:
```python
tools = {
    'llvm-as': '/usr/lib/llvm-20/bin/llvm-as',  # LLVM assembler
    'lli': '/usr/lib/llvm-20/bin/lli',          # LLVM interpreter
    'opt': '/usr/lib/llvm-20/bin/opt',          # LLVM optimizer
    'FileCheck': 'FileCheck',                   # Output checker
    'clang': 'clang',                           # C/C++ compiler
    'clang++': 'clang++',                       # C++ compiler
}
```

## How Tests Execute

### Test Flow Example
```bash
# When you run: lit tests/basic/hello.ll
# lit processes this:

; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

# Into these actual commands:
/usr/lib/llvm-20/bin/llvm-as tests/basic/hello.ll -o /tmp/unique.bc
/usr/lib/llvm-20/bin/lli /tmp/unique.bc | FileCheck tests/basic/hello.ll
```

### Substitution Variables
- `%s` → Source file path (`tests/basic/hello.ll`)
- `%t` → Unique temporary file base (`Output/test.tmp`)
- `%T` → Test execution root (`Output/`)
- `%llvm-as` → `/usr/lib/llvm-20/bin/llvm-as`

## FileCheck Deep Dive

### Basic Pattern Matching
```llvm
; Simple string match
; CHECK: Hello, World!

; Regex patterns
; CHECK: define {{.*}} @main()
; CHECK: %{{[0-9]+}} = add i32

; Whitespace flexible
; CHECK: ret i32 0
```

### Advanced FileCheck Features

#### 1. **Check Prefixes** (Multiple Test Modes)
```llvm
; RUN: %clang -O0 %s -S -emit-llvm -o - | %FileCheck %s --check-prefix=UNOPT
; RUN: %clang -O2 %s -S -emit-llvm -o - | %FileCheck %s --check-prefix=OPT

; UNOPT: %x = alloca i32
; UNOPT: store i32 42, ptr %x

; OPT-NOT: alloca
; OPT: ret i32 42
```

#### 2. **Variable Capture and Reuse**
```llvm
; CHECK: %[[VAR:[0-9]+]] = load i32, ptr %x
; CHECK: %{{[0-9]+}} = add i32 %[[VAR]], 1
```

#### 3. **Negative Checks**
```llvm
; CHECK-NOT: alloca        ; This should NOT appear
; CHECK: ret i32          ; This should appear
; CHECK-NOT: unreachable   ; This should NOT appear
```

#### 4. **Ordered Checks**
```llvm
; CHECK: function start
; CHECK-NEXT: first instruction    ; Must be immediately after
; CHECK-SAME: on same line        ; Must be on same line
; CHECK-EMPTY:                    ; Must be empty line
```

## Advanced lit Features

### 1. **Feature-Based Testing**
Your `lit.cfg.py` defines available features:
```python
if platform.system() == 'Linux':
    config.available_features.add('system-linux')
if platform.machine() in ['x86_64', 'AMD64']:
    config.available_features.add('x86_64')
```

Use in tests:
```llvm
; REQUIRES: system-linux
; REQUIRES: x86_64
; UNSUPPORTED: windows
```

### 2. **Test Execution Control**
```llvm
; XFAIL: *           ; Expected to fail (known issue)
; XFAIL: system-linux ; Expected to fail on Linux only
```

### 3. **Multiple RUN Lines**
```llvm
; RUN: %clang %s -o %t
; RUN: %t | %FileCheck %s
; RUN: %t --verbose | %FileCheck %s --check-prefix=VERBOSE
```

### 4. **Complex Command Pipelines**
```llvm
; RUN: %clang -S -emit-llvm %s -o - | %opt -passes=sroa | %FileCheck %s
; RUN: not %clang %s 2>&1 | %FileCheck %s --check-prefix=ERROR
```

## Practical Examples

### Example 1: Testing Optimization Passes
```llvm
; RUN: %opt -passes=constprop %s -S | %FileCheck %s

define i32 @test() {
  %x = add i32 10, 32
  ret i32 %x
}

; CHECK: ret i32 42
; CHECK-NOT: add i32
```

### Example 2: Error Message Testing
```llvm
; RUN: not %clang %s 2>&1 | %FileCheck %s

int main() {
    undefined_function();  // Should cause error
}

; CHECK: error: use of undeclared identifier 'undefined_function'
```

### Example 3: Multi-File Testing
```llvm
; RUN: %clang %S/helper.c %s -o %t
; RUN: %t | %FileCheck %s
; (Uses helper.c from same directory as test)
```

## Extended Toolchain Usage

### 1. **Adding Custom Tools**
Add to `lit.cfg.py`:
```python
tools['my-tool'] = '/path/to/my-tool'
config.substitutions.append(('%my-tool', '/path/to/my-tool'))
```

### 2. **Environment Variables**
```python
config.environment['MY_VAR'] = 'value'
```

### 3. **Custom Test Formats**
```python
# For different file types
config.suffixes = ['.ll', '.c', '.cpp', '.py', '.test']
```

### 4. **Timeout and Resource Limits**
```bash
# Run with timeout
lit --timeout=30 tests/

# Parallel execution
lit -j 8 tests/
```

## Debugging Test Failures

### Verbose Output
```bash
lit -v tests/failing_test.ll    # See all commands executed
lit -vv tests/failing_test.ll   # Even more verbose
```

### Preserving Temporary Files
```bash
lit --no-cleanup tests/         # Keep temp files for inspection
```

### Interactive Debugging
```bash
# Run the failing commands manually
llvm-as tests/basic/hello.ll -o /tmp/test.bc
lli /tmp/test.bc
```

## Power User Tips

### 1. **FileCheck Variables for Complex Matching**
```llvm
; CHECK: %[[BASE:[a-zA-Z0-9]+]] = getelementptr
; CHECK: store i32 %{{[0-9]+}}, ptr %[[BASE]]
```

### 2. **Testing Across Multiple Architectures**
```llvm
; RUN: %clang --target=x86_64 %s -S -o - | %FileCheck %s --check-prefix=X64
; RUN: %clang --target=aarch64 %s -S -o - | %FileCheck %s --check-prefix=ARM64

; X64: movl
; ARM64: mov w
```

### 3. **Incremental Testing**
```bash
# Test only modified files
lit --incremental tests/

# Filter by name pattern
lit tests/ -k "math"           # Only tests with "math" in name
lit tests/ --filter=".*opt.*"  # Regex filtering
```

### 4. **JSON Output for Analysis**
```bash
lit --output-format=json tests/ > results.json
```

This toolchain gives you enterprise-level testing capabilities used by LLVM itself. You can test compilation, optimization, execution, error handling, and cross-platform behavior with precise control and verification.