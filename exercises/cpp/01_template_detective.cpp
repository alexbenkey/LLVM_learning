// RUN: %clang++ -S -emit-llvm -O0 %s -o %t-O0.ll
// RUN: %clang++ -S -emit-llvm -O2 %s -o %t-O2.ll
// RUN: %FileCheck %s --check-prefix=UNOPT --input-file=%t-O0.ll
// RUN: %FileCheck %s --check-prefix=OPT --input-file=%t-O2.ll

// CHALLENGE C++1: Template Detective
//
// GOAL: Understand how C++ templates generate LLVM IR
// 
// TASK: You are given this C++ template code. Your job is to:
// 1. Predict what LLVM IR will be generated (both -O0 and -O2)
// 2. Fill in the CHECK patterns below to match the actual output
// 3. Understand the difference between unoptimized and optimized IR
//
// CONSTRAINTS:
// - Cannot modify the C++ code (it's intentionally complex)
// - Must research template instantiation in LLVM IR
// - Must predict optimization behavior
//
// RESEARCH SKILLS NEEDED:
// - C++ template instantiation mechanics
// - LLVM IR function name mangling
// - Constant folding and inlining optimizations
// - Template specialization patterns
//
// DIFFICULTY: ⭐⭐⭐☆☆

#include <iostream>

template<int N>
struct Factorial {
    static constexpr int value = N * Factorial<N-1>::value;
};

template<>
struct Factorial<0> {
    static constexpr int value = 1;
};

template<typename T, int N>
class PowerCalculator {
public:
    static T power(T base) {
        return base * PowerCalculator<T, N-1>::power(base);
    }
};

template<typename T>
class PowerCalculator<T, 0> {
public:
    static T power(T base) {
        return static_cast<T>(1);
    }
};

void demonstrate_templates() {
    // These will trigger template instantiations
    int fact5 = Factorial<5>::value;
    double power_result = PowerCalculator<double, 3>::power(2.0);
    
    std::cout << "5! = " << fact5 << std::endl;
    std::cout << "2^3 = " << power_result << std::endl;
}

int main() {
    demonstrate_templates();
    return 0;
}

// TODO: Fill in what you think the unoptimized IR will contain
// Research: How are C++ template instantiations represented in LLVM IR?
// Hint: Look for mangled function names and instantiated templates

// UNOPT-LABEL: define {{.*}} @_Z19demonstrate_templatesv()
// UNOPT: ???  // What do you think will be here for Factorial<5>::value?
// UNOPT: ???  // How will PowerCalculator be instantiated?
// UNOPT: ???  // Will there be multiple template instantiations?

// TODO: Fill in what you think the optimized IR will contain
// Research: How does -O2 optimization affect template-generated code?
// Think: Can the compiler optimize away template recursion?

// OPT-LABEL: define {{.*}} @_Z19demonstrate_templatesv()
// OPT: ???   // Will factorial calculation be optimized to a constant?
// OPT: ???   // Will power calculation be inlined/optimized?
// OPT: ???   // How many function calls will remain?

// TODO: Replace all ??? with your predictions
// Run the test to see if you understand template compilation!