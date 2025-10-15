# lit Command Reference & Practical Usage

## Your Current Toolchain Setup

### Configuration (`lit.cfg.py`)
```python
# Your tools are mapped to actual binaries:
'llvm-as': '/usr/lib/llvm-20/bin/llvm-as'  # LLVM IR assembler
'lli': '/usr/lib/llvm-20/bin/lli'          # LLVM interpreter
'opt': '/usr/lib/llvm-20/bin/opt'          # LLVM optimizer  
'FileCheck': 'FileCheck'                   # Pattern matcher
'clang': 'clang'                           # C compiler
'clang++': 'clang++'                       # C++ compiler

# Available features in your setup:
- system-linux (you're on Linux)
- x86_64 (your architecture)
```

## Essential lit Commands

### Basic Test Execution
```bash
# Run all tests
lit tests/

# Run specific test with verbose output
lit -v tests/basic/hello.ll

# Run tests in specific directory  
lit tests/advanced/

# Run with multiple workers (parallel)
lit -j 8 tests/

# Show timing information
lit --time-tests tests/
```

### Test Discovery & Filtering
```bash
# Show all available tests (don't run them)
lit --show-tests tests/

# Show which features are used by tests
lit --show-used-features tests/

# Filter tests by regex pattern
lit --filter=".*math.*" tests/        # Only math-related tests
lit --filter-out=".*cpp.*" tests/     # Exclude C++ tests

# Limit number of tests
lit --max-tests 5 tests/
```

### Debugging & Analysis
```bash
# Very verbose output (see all commands)
lit -vv tests/basic/hello.ll

# Show succinct output
lit -s tests/

# Preserve temporary files for inspection
lit --no-cleanup tests/

# Run with timeout
lit --timeout=30 tests/

# Show excluded/skipped tests
lit --show-excluded --show-skipped tests/
```

## FileCheck Patterns You Can Use

### Basic Patterns
```llvm
; Exact match
; CHECK: Hello, World!

; Regex wildcards
; CHECK: define {{.*}} @main()
; CHECK: %{{[0-9]+}} = add i32

; Variable capture and reuse
; CHECK: %[[VAR:[0-9]+]] = load i32
; CHECK: store i32 42, ptr %[[VAR]]
```

### Control Flow Checks
```llvm
; Must appear in order
; CHECK: first thing
; CHECK: second thing

; Must be on next line
; CHECK: some instruction
; CHECK-NEXT: immediately following

; Must be on same line
; CHECK: instruction{{.*}}
; CHECK-SAME: continuing same line

; Should NOT appear
; CHECK-NOT: bad_instruction

; Empty line check
; CHECK-EMPTY:
```

### Multiple Test Modes
```llvm
; Different optimization levels
; RUN: %opt -O0 %s -S | %FileCheck %s --check-prefix=UNOPT
; RUN: %opt -O2 %s -S | %FileCheck %s --check-prefix=OPT

; UNOPT: alloca
; OPT-NOT: alloca
; OPT: ret i32 42
```

## Advanced Test Patterns

### Testing Optimizations
```llvm
; RUN: %opt -passes=constprop %s -S | %FileCheck %s

define i32 @test() {
  %result = add i32 10, 32
  ret i32 %result
}

; After constant propagation:
; CHECK-NOT: add i32
; CHECK: ret i32 42
```

### Error Testing
```llvm
; RUN: not %llvm-as %s -o /dev/null 2>&1 | %FileCheck %s

define i32 @bad_function() {
  %x = add i32 %undefined, 42  ; This should fail
  ret i32 %x
}

; CHECK: use of undefined value
```

### Platform-Specific Tests
```llvm
; REQUIRES: system-linux
; UNSUPPORTED: windows
; XFAIL: system-darwin

; RUN: uname -s | %FileCheck %s
; CHECK: Linux
```

## Practical Workflows

### 1. Development Workflow
```bash
# While developing a test:
lit -v tests/my_new_test.ll          # Run with verbose output
lit --no-cleanup tests/my_new_test.ll # Keep temp files to inspect

# Check what temp files were created:
ls -la Output/tests/Output/
```

### 2. CI/Automation Workflow
```bash
# Run all tests with timing and parallel execution
lit -j $(nproc) --time-tests tests/

# Generate XML output for CI systems
lit --xunit-xml-output results.xml tests/
```

### 3. Debugging Failures
```bash
# 1. Run with maximum verbosity
lit -vv tests/failing_test.ll

# 2. Extract the actual commands and run manually
llvm-as tests/failing_test.ll -o /tmp/debug.bc
lli /tmp/debug.bc

# 3. Check intermediate files
cat Output/tests/Output/failing_test.ll.tmp.ll
```

### 4. Performance Analysis
```bash
# Time individual tests
lit --time-tests tests/ | grep "Slowest"

# Run subset for quick iteration
lit --max-tests 10 tests/

# Parallel execution for large test suites
lit -j 16 tests/
```

## Advanced Configuration Options

### Adding Custom Tools
Add to your `lit.cfg.py`:
```python
tools['my-analyzer'] = '/path/to/my-analyzer'
config.substitutions.append(('%my-analyzer', '/path/to/my-analyzer'))
```

### Custom Environment Variables
```python
config.environment['LLVM_DISABLE_CRASH_REPORT'] = '1'
config.environment['MALLOC_CHECK_'] = '2'
```

### Custom Features
```python
# Add feature detection
if subprocess.call(['which', 'valgrind'], stdout=subprocess.DEVNULL) == 0:
    config.available_features.add('valgrind')
```

## Real-World Example: Testing a Compiler Pass

```llvm
; RUN: %opt -load-pass-plugin=%my_plugin -passes=my-pass %s -S | %FileCheck %s
; RUN: %opt -load-pass-plugin=%my_plugin -passes=my-pass -debug %s -S 2>&1 | %FileCheck %s --check-prefix=DEBUG
; REQUIRES: plugins

define i32 @example(i32 %x) {
entry:
  %doubled = mul i32 %x, 2
  %result = add i32 %doubled, 0  ; This should be optimized away
  ret i32 %result
}

; CHECK-LABEL: @example
; CHECK: %doubled = mul i32 %x, 2
; CHECK-NOT: add i32 %doubled, 0
; CHECK: ret i32 %doubled

; DEBUG: Running my-pass on function example
; DEBUG: Eliminating add with zero
```

This toolchain gives you professional-grade testing capabilities used by LLVM developers worldwide!