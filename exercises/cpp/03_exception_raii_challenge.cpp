// RUN: %clang++ -S -emit-llvm %s -o %t.ll
// RUN: %clang++ %s -o %t.exe
// RUN: %t.exe | %FileCheck %s --check-prefix=OUTPUT
// RUN: %FileCheck %s --check-prefix=IR --input-file=%t.ll

// CHALLENGE C++3: Exception Handling and RAII
//
// GOAL: Understand how C++ exceptions and RAII are implemented in LLVM IR
//
// TASK: This code demonstrates exception handling and RAII. Your job is to:
// 1. Predict which constructors/destructors get called in normal and exception cases
// 2. Understand how stack unwinding is implemented in LLVM IR
// 3. Identify exception handling constructs in the generated IR
// 4. Trace the execution path through both success and failure scenarios
//
// CONSTRAINTS:
// - Cannot modify the C++ code
// - Must understand exception handling mechanisms
// - Must research LLVM IR exception handling primitives
//
// RESEARCH SKILLS NEEDED:
// - C++ exception handling implementation
// - Stack unwinding mechanisms
// - LLVM IR exception handling constructs (invoke, landingpad, etc.)
// - RAII (Resource Acquisition Is Initialization) patterns
//
// DIFFICULTY: ⭐⭐⭐⭐⭐

#include <iostream>
#include <stdexcept>

class Resource {
private:
    int id;
    static int next_id;
public:
    Resource() : id(next_id++) {
        std::cout << "Resource " << id << " acquired" << std::endl;
    }
    
    ~Resource() {
        std::cout << "Resource " << id << " released" << std::endl;
    }
    
    void use() {
        std::cout << "Using resource " << id << std::endl;
    }
    
    void dangerous_operation() {
        if (id == 2) {  // Third resource will throw
            throw std::runtime_error("Resource 2 failed!");
        }
        std::cout << "Resource " << id << " operation successful" << std::endl;
    }
};

int Resource::next_id = 0;

void test_exception_safety() {
    std::cout << "=== Starting exception safety test ===" << std::endl;
    
    try {
        Resource r1;  // Should be acquired
        r1.use();
        
        Resource r2;  // Should be acquired
        r2.use();
        
        Resource r3;  // Should be acquired, but will throw in dangerous_operation
        r3.use();
        
        // These operations will test exception safety
        r1.dangerous_operation();  // Should succeed
        r2.dangerous_operation();  // Should succeed
        r3.dangerous_operation();  // Should throw!
        
        std::cout << "All operations completed successfully" << std::endl;
        
    } catch (const std::exception& e) {
        std::cout << "Exception caught: " << e.what() << std::endl;
        std::cout << "Stack unwinding should destroy resources in reverse order" << std::endl;
    }
    
    std::cout << "=== Test completed ===" << std::endl;
}

int main() {
    test_exception_safety();
    return 0;
}

// TODO: Predict the exact output sequence
// Think about: What happens during stack unwinding?
// Consider: Which destructors get called when exception is thrown?

// OUTPUT: === Starting exception safety test ===
// OUTPUT: ???  // Which resource gets acquired first?
// OUTPUT: ???  // What happens when r1.use() is called?
// OUTPUT: ???  // Which resource gets acquired second?
// OUTPUT: ???  // What happens when r2.use() is called?
// OUTPUT: ???  // Which resource gets acquired third?
// OUTPUT: ???  // What happens when r3.use() is called?
// OUTPUT: ???  // What happens with r1.dangerous_operation()?
// OUTPUT: ???  // What happens with r2.dangerous_operation()?
// OUTPUT: ???  // What happens when r3.dangerous_operation() throws?
// OUTPUT: ???  // What does the exception message say?
// OUTPUT: ???  // What happens during stack unwinding?
// OUTPUT: ???  // Which destructors get called and in what order?
// OUTPUT: === Test completed ===

// TODO: Predict what exception handling constructs appear in LLVM IR
// Research: How does C++ exception handling translate to LLVM IR?
// Look for: invoke, landingpad, resume instructions

// IR: ???  // Will there be 'invoke' instructions instead of 'call'?
// IR: ???  // Will there be landingpad blocks for exception handling?
// IR: ???  // How is stack unwinding implemented?
// IR: ???  // Will there be personality function declarations?
// IR: ???  // How are destructors called during unwinding?

// TODO: Fill in all ??? with your predictions
// This is advanced! Research LLVM exception handling documentation.