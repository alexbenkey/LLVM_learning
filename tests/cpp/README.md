# C++ Test Examples

This directory contains examples of using lit with C++ source files, demonstrating various testing patterns for LLVM compilation and optimization.

## Test Files

### `simple_math.cpp`
**Pattern:** Basic execution test
- Compiles C++ to LLVM IR, then to bytecode
- Executes the bytecode with `lli`
- Verifies program output using FileCheck

### `optimization_check.cpp`
**Pattern:** Optimization comparison test  
- Compiles the same source with different optimization levels (-O0 vs -O2)
- Uses multiple check prefixes (`UNOPT` and `OPT`) to verify different patterns
- Demonstrates constant folding optimization where `10 + 32` becomes `42`

### `template_test.cpp`
**Pattern:** Template instantiation verification
- Compiles C++ templates and checks the generated IR
- Verifies that both `int` and `double` template instantiations are present
- Checks for correct instruction types (`mul nsw i32` vs `fmul double`)

### `class_test.cpp`
**Pattern:** Object-oriented feature test
- Tests C++ class compilation to LLVM IR
- Compiles, executes, and verifies runtime behavior
- Demonstrates constructor/method compilation

## Common C++ Test Patterns

### Compilation Pipeline
```cpp
// RUN: %clang++ -S -emit-llvm %s -o %t.ll
// RUN: %llvm-as %t.ll -o %t.bc  
// RUN: %lli %t.bc | %FileCheck %s
```

### IR Pattern Checking
```cpp
// RUN: %clang++ -S -emit-llvm %s -o %t.ll
// RUN: %FileCheck %s --input-file=%t.ll
```

### Optimization Comparison
```cpp
// RUN: %clang++ -S -emit-llvm -O0 %s -o %t-O0.ll
// RUN: %clang++ -S -emit-llvm -O2 %s -o %t-O2.ll
// RUN: %FileCheck %s --check-prefix=UNOPT --input-file=%t-O0.ll
// RUN: %FileCheck %s --check-prefix=OPT --input-file=%t-O2.ll
```

## Key Features Demonstrated

- **Multi-stage compilation**: C++ → LLVM IR → bytecode → execution
- **Optimization verification**: Comparing unoptimized vs optimized IR
- **Template handling**: Verifying template instantiation patterns  
- **Mangled name patterns**: Using regex patterns for C++ name mangling
- **Multiple check prefixes**: Testing different compilation modes
- **FileCheck patterns**: Regex matching for flexible IR verification

## Running the Tests

```bash
# Run all C++ tests
lit tests/cpp/

# Run specific test with verbose output
lit -v tests/cpp/template_test.cpp

# Run tests and show generated IR files
lit tests/cpp/ && ls -la Output/tests/cpp/Output/
```