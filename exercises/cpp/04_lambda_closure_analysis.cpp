// RUN: %clang++ -S -emit-llvm -O0 %s -o %t-O0.ll
// RUN: %clang++ -S -emit-llvm -O2 %s -o %t-O2.ll
// RUN: %clang++ %s -o %t.exe
// RUN: %t.exe | %FileCheck %s --check-prefix=OUTPUT
// RUN: %FileCheck %s --check-prefix=UNOPT --input-file=%t-O0.ll
// RUN: %FileCheck %s --check-prefix=OPT --input-file=%t-O2.ll

// CHALLENGE C++4: Lambda Captures and Closures
//
// GOAL: Understand how C++ lambdas are implemented as closures in LLVM IR
//
// TASK: This code uses various lambda capture modes. Your job is to:
// 1. Predict what gets printed (understand capture semantics)
// 2. Understand how closures are represented in LLVM IR
// 3. Compare unoptimized vs optimized closure implementations
// 4. Identify how different capture modes translate to IR
//
// CONSTRAINTS:
// - Cannot modify the C++ code
// - Must understand lambda capture mechanics (by value, by reference, mutable)
// - Must research closure implementation in LLVM IR
//
// RESEARCH SKILLS NEEDED:
// - C++ lambda capture modes and semantics
// - Closure object layout and implementation
// - Function object generation in LLVM IR
// - Optimization of lambda expressions
//
// DIFFICULTY: ⭐⭐⭐⭐☆

#include <iostream>
#include <functional>
#include <vector>

void lambda_capture_analysis() {
    int x = 10;
    int y = 20;
    
    // Capture by value
    auto lambda1 = [x, y](int multiplier) {
        return x * multiplier + y;
    };
    
    // Capture by reference
    auto lambda2 = [&x, &y](int increment) {
        x += increment;
        y += increment;
        return x + y;
    };
    
    // Capture by value, but mutable
    auto lambda3 = [x, y](int delta) mutable {
        x += delta;  // This modifies the copy, not original
        y += delta;
        return x * y;
    };
    
    // Mixed capture with implicit this capture in a hypothetical member context
    auto lambda4 = [=, &y](int factor) {  // Capture all by value, except y by reference
        return x * factor + y;  // x is copied, y is referenced
    };
    
    std::cout << "=== Lambda Capture Analysis ===" << std::endl;
    
    std::cout << "Original values: x=" << x << ", y=" << y << std::endl;
    
    int result1 = lambda1(3);  // Should be 10*3 + 20 = 50
    std::cout << "Lambda1 result: " << result1 << std::endl;
    std::cout << "After lambda1: x=" << x << ", y=" << y << std::endl;
    
    int result2 = lambda2(5);  // Should modify x and y, then return sum
    std::cout << "Lambda2 result: " << result2 << std::endl;
    std::cout << "After lambda2: x=" << x << ", y=" << y << std::endl;
    
    int result3 = lambda3(2);  // Should work with copies
    std::cout << "Lambda3 result: " << result3 << std::endl;
    std::cout << "After lambda3: x=" << x << ", y=" << y << std::endl;
    
    int result4 = lambda4(4);  // Mixed capture semantics
    std::cout << "Lambda4 result: " << result4 << std::endl;
    std::cout << "After lambda4: x=" << x << ", y=" << y << std::endl;
}

int main() {
    lambda_capture_analysis();
    return 0;
}

// TODO: Predict the exact execution trace
// Think carefully about capture semantics!

// OUTPUT: === Lambda Capture Analysis ===
// OUTPUT: Original values: x=10, y=20
// OUTPUT: Lambda1 result: ???  // What is 10*3 + 20?
// OUTPUT: After lambda1: x=???, y=???  // Do the originals change?
// OUTPUT: Lambda2 result: ???  // What happens when x and y are incremented by 5?
// OUTPUT: After lambda2: x=???, y=???  // How are the originals affected?
// OUTPUT: Lambda3 result: ???  // What happens with mutable copies?
// OUTPUT: After lambda3: x=???, y=???  // Are originals affected by mutable lambda?
// OUTPUT: Lambda4 result: ???  // Mixed capture: how does this work?
// OUTPUT: After lambda4: x=???, y=???  // Which variables are affected?

// TODO: Predict lambda implementation in unoptimized LLVM IR
// Research: How are lambdas implemented as closure objects?

// UNOPT: ???  // Will there be struct types for closure objects?
// UNOPT: ???  // How are captured variables stored in the closure?
// UNOPT: ???  // Will there be separate functions for each lambda?
// UNOPT: ???  // How is the function call operator implemented?
// UNOPT: ???  // How do by-reference captures differ from by-value in IR?

// TODO: Predict optimization effects on lambda implementation
// Research: How does -O2 optimize lambda expressions?

// OPT: ???  // Will lambdas be inlined away completely?
// OPT: ???  // Will closure objects be eliminated?
// OPT: ???  // How will capture optimization work?
// OPT: ???  // Will there be any function calls left?

// TODO: Replace all ??? with your research-based predictions!