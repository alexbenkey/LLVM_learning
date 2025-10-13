// RUN: %clang++ -S -emit-llvm %s -o %t.ll
// RUN: %llvm-as %t.ll -o %t.bc
// RUN: %lli %t.bc | %FileCheck %s

// This test demonstrates C++ class compilation and execution

#include <iostream>

class Calculator {
private:
    int value;

public:
    Calculator(int initial_value) : value(initial_value) {}
    
    int add(int operand) {
        value += operand;
        return value;
    }
    
    int get_value() const {
        return value;
    }
};

int main() {
    Calculator calc(10);
    calc.add(20);
    calc.add(12);
    
    std::cout << "Final value: " << calc.get_value() << std::endl;
    return 0;
}

// CHECK: Final value: 42