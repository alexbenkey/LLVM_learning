# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is an educational project for exploring LLVM's `lit` (LLVM Integrated Tester) framework. The project demonstrates various testing patterns, LLVM IR manipulation, and tool integration techniques used in LLVM development.

## Essential Commands

### Setup and Prerequisites
```bash
# Initial setup - checks tools and creates output directory
./scripts/setup.sh

# Verify required LLVM tools are installed
lit --version
clang --version
FileCheck --version
```

### Running Tests
```bash
# Run all tests
lit tests/

# Run tests with verbose output
lit -v tests/

# Run specific test file
lit tests/basic/hello.ll

# Run tests in specific directory
lit tests/advanced/

# Run tests with JSON output
lit --output-format=json tests/

# Show available tests without running them
lit --show-tests tests/
```

### Development Commands
```bash
# Use convenience script with options
./scripts/run-tests.sh                    # Run all tests
./scripts/run-tests.sh -v                 # Verbose output
./scripts/run-tests.sh tests/basic/       # Run specific directory

# Compile LLVM IR manually for testing
llvm-as examples/ir/simple_math.ll -o simple_math.bc
lli simple_math.bc

# Generate IR from C source
clang -S -emit-llvm examples/simple.c -o simple.ll

# Run optimization passes manually
opt -passes="sroa,early-cse" input.ll -S -o output.ll
```

## Architecture and Structure

### Lit Configuration System
- **`lit.cfg.py`**: Main test configuration defining test formats, tool substitutions, and platform-specific features
- **`lit.site.cfg.in`**: Template for site-specific configuration (build system integration)
- The configuration uses `llvm_config` utilities for automatic tool discovery and substitution setup

### Test Organization Pattern
Tests are organized by complexity and demonstrate different lit/LLVM testing patterns:

- **`tests/basic/`**: Simple LLVM IR tests using basic FileCheck patterns
- **`tests/advanced/`**: Optimization pipeline tests showing before/after transformations
- **`tests/filecheck/`**: Examples of FileCheck pattern matching capabilities

### Tool Substitution System
The project uses lit's substitution system extensively:
- Standard LLVM tools (`%clang`, `%opt`, `%FileCheck`, etc.) are auto-configured
- Custom substitutions: `%build_dir`, `%src_dir` for path references
- Platform-specific features are detected and available in tests

### Test Execution Model
Tests follow the RUN/CHECK pattern:
- `; RUN: command` lines define shell commands to execute
- `; CHECK: pattern` lines define expected output patterns
- Multiple RUN lines create a pipeline of commands
- FileCheck supports regex patterns `{{...}}`, variable capture `[[VAR:pattern]]`, and reuse `[[VAR]]`

## Key Test Patterns

### LLVM IR Testing
Tests typically compile IR to bytecode, execute with `lli`, and verify output:
```llvm
; RUN: llvm-as %s -o %t.bc
; RUN: lli %t.bc | FileCheck %s
```

### Optimization Testing
Advanced tests verify optimization pass effects:
```llvm
; RUN: opt -passes="function(sroa,early-cse)" %s -S | FileCheck %s
; CHECK-NOT: alloca
; CHECK: add i32 %x, %y
```

### Multi-Stage Testing
Complex tests use multiple check prefixes for different optimization levels:
```llvm
; RUN: opt -passes="default<O2>" %s -S | FileCheck %s --check-prefix=O2
; O2: optimized_pattern
```

## Directory Structure Context

- **`examples/`**: Reference LLVM IR and C source files for test development
- **`scripts/`**: Environment setup and test execution utilities
- **`Output/`**: Generated during test runs (git-ignored)
- **`docs/`**: Additional documentation (if present)

## Development Workflow

1. Use `./scripts/setup.sh` to verify environment before development
2. Create new tests following existing patterns in appropriate subdirectories
3. Test configurations are automatically loaded from `lit.cfg.py`
4. Use `lit -v` for debugging test failures
5. The `%t` substitution creates unique temporary files for test isolation