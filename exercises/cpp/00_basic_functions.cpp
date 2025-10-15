// RUN: %clang++ -S -emit-llvm -O0 %s -o %t-O0.ll
// RUN: %clang++ -S -emit-llvm -O2 %s -o %t-O2.ll
// RUN: %clang++ %s -o %t.exe
// RUN: %t.exe | %FileCheck %s --check-prefix=OUTPUT
// RUN: %FileCheck %s --check-prefix=UNOPT --input-file=%t-O0.ll
// RUN: %FileCheck %s --check-prefix=OPT --input-file=%t-O2.ll

// CHALLENGE C++0: Basic Functions - Gentle Introduction
//
// GOAL: Understand how simple C++ functions translate to LLVM IR
//
// TASK: This is a gentle introduction to C++ → LLVM IR analysis. You need to:
// 1. Predict what this simple C++ program will output
// 2. Understand how basic C++ constructs appear in LLVM IR
// 3. See the difference between -O0 and -O2 optimization
// 4. Fill in the CHECK patterns with your predictions
//
// CONSTRAINTS:
// - This is intentionally simple - no advanced C++ features
// - Focus on understanding the prediction process
// - Learn how to read LLVM IR generated from C++
//
// RESEARCH SKILLS NEEDED:
// - Basic C++ function calls and arithmetic
// - Simple LLVM IR function structure
// - Understanding compiler optimization basics
//
// DIFFICULTY: ⭐⭐☆☆☆

#include <iostream>

// Simple function that adds two numbers
int add_numbers(int a, int b) {
    return a + b;
}

// Function that calculates a simple expression
int calculate_expression(int x) {
    int result = x * 2 + 10;
    return result;
}

// Function that demonstrates basic branching
int check_positive(int num) {
    if (num > 0) {
        return 1;
    } else {
        return 0;
    }
}

int main() {
    std::cout << "=== Basic Function Demo ===" << std::endl;
    
    // Test addition
    int sum = add_numbers(15, 27);
    std::cout << "15 + 27 = " << sum << std::endl;
    
    // Test expression calculation
    int expr_result = calculate_expression(5);
    std::cout << "5 * 2 + 10 = " << expr_result << std::endl;
    
    // Test conditional
    int positive_check = check_positive(42);
    std::cout << "Is 42 positive? " << positive_check << std::endl;
    
    return 0;
}

// TODO: Predict what this program will output
// This should be straightforward - just basic arithmetic and logic

// OUTPUT: === Basic Function Demo ===
// OUTPUT: 15 + 27 = ???  // What's 15 + 27?
// OUTPUT: 5 * 2 + 10 = ???  // What's 5 * 2 + 10?
// OUTPUT: Is 42 positive? ???  // Is 42 > 0? (1 for true, 0 for false)

// TODO: Predict what the unoptimized LLVM IR will contain
// Look for basic patterns - function definitions, function calls, arithmetic

// UNOPT-LABEL: define {{.*}} @_Z11add_numbersii(i32 {{.*}}, i32 {{.*}})
// UNOPT: ???  // What instruction does addition become in LLVM IR?
// UNOPT: ???  // How does the function return the result?

// UNOPT-LABEL: define {{.*}} @_Z19calculate_expressioni(i32 {{.*}})
// UNOPT: ???  // What instruction does multiplication become?
// UNOPT: ???  // What instruction does addition become?

// UNOPT-LABEL: define {{.*}} @_Z14check_positivei(i32 {{.*}})
// UNOPT: ???  // What instruction compares the number with 0?
// UNOPT: ???  // How does the if-else translate to basic blocks?

// TODO: Predict optimization effects
// Think: Will these simple functions be inlined? Will arithmetic be optimized?

// OPT-LABEL: define {{.*}} @main()
// OPT: ???  // Will function calls still be present, or will they be inlined?
// OPT: ???  // Will the arithmetic be computed at compile time?
// OPT: ???  // How many function calls will remain in the optimized version?

// TODO: Replace all ??? with your predictions
// Start simple - this is your introduction to the prediction process!