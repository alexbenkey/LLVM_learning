// RUN: %clang++ -S -emit-llvm %s -o %t.ll
// RUN: %llvm-as %t.ll -o %t.bc
// RUN: %lli %t.bc | %FileCheck %s

// Simple C++ math test demonstrating compilation pipeline
// This test compiles C++ to LLVM IR, then to bytecode, then executes

#include <iostream>

int add(int a, int b) {
    return a + b;
}

int main() {
    int result = add(15, 27);
    std::cout << "Result: " << result << std::endl;
    return 0;
}

// CHECK: Result: 42