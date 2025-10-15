// RUN: %clang++ -S -emit-llvm -O0 %s -o %t-O0.ll
// RUN: %clang++ -S -emit-llvm -O2 %s -o %t-O2.ll
// RUN: %clang++ %s -o %t.exe
// RUN: %t.exe | %FileCheck %s --check-prefix=OUTPUT
// RUN: %FileCheck %s --check-prefix=UNOPT --input-file=%t-O0.ll
// RUN: %FileCheck %s --check-prefix=OPT --input-file=%t-O2.ll

// CHALLENGE C++5: Move Semantics and Perfect Forwarding
//
// GOAL: Understand how C++11 move semantics and perfect forwarding work in LLVM IR
//
// TASK: This code demonstrates move semantics, perfect forwarding, and RAII. Your job is to:
// 1. Predict which constructors/destructors get called (copy vs move)
// 2. Understand how std::forward and std::move translate to LLVM IR
// 3. Analyze how RVO (Return Value Optimization) affects the generated code
// 4. Identify where copies are eliminated by move semantics
//
// CONSTRAINTS:
// - Cannot modify the C++ code
// - Must understand the difference between lvalues and rvalues
// - Must research how perfect forwarding templates are instantiated
//
// RESEARCH SKILLS NEEDED:
// - C++11 move semantics and rvalue references
// - Perfect forwarding with std::forward
// - Template argument deduction for universal references
// - Return Value Optimization (RVO) and Named RVO (NRVO)
//
// DIFFICULTY: ⭐⭐⭐⭐⭐

#include <iostream>
#include <utility>
#include <string>

class MoveTracker {
private:
    std::string name;
    int* data;
    
public:
    // Constructor
    MoveTracker(const std::string& n) : name(n), data(new int(42)) {
        std::cout << "Constructor: " << name << std::endl;
    }
    
    // Copy constructor
    MoveTracker(const MoveTracker& other) : name(other.name + "_copy"), data(new int(*other.data)) {
        std::cout << "Copy constructor: " << name << " from " << other.name << std::endl;
    }
    
    // Move constructor
    MoveTracker(MoveTracker&& other) noexcept : name(other.name + "_moved"), data(other.data) {
        other.data = nullptr;
        std::cout << "Move constructor: " << name << " from " << other.name << std::endl;
    }
    
    // Copy assignment
    MoveTracker& operator=(const MoveTracker& other) {
        if (this != &other) {
            delete data;
            name = other.name + "_copy_assigned";
            data = new int(*other.data);
            std::cout << "Copy assignment: " << name << " from " << other.name << std::endl;
        }
        return *this;
    }
    
    // Move assignment
    MoveTracker& operator=(MoveTracker&& other) noexcept {
        if (this != &other) {
            delete data;
            name = other.name + "_move_assigned";
            data = other.data;
            other.data = nullptr;
            std::cout << "Move assignment: " << name << " from " << other.name << std::endl;
        }
        return *this;
    }
    
    // Destructor
    ~MoveTracker() {
        std::cout << "Destructor: " << name << std::endl;
        delete data;
    }
    
    const std::string& getName() const { return name; }
};

// Perfect forwarding function template
template<typename T>
void process_object(T&& obj) {
    std::cout << "Processing: " << obj.getName() << std::endl;
    
    // Forward the object to another function
    auto result = std::forward<T>(obj);
    std::cout << "Forwarded to: " << result.getName() << std::endl;
}

MoveTracker create_object(const std::string& name) {
    MoveTracker obj(name);
    return obj;  // Should trigger RVO or move
}

void move_semantics_demo() {
    std::cout << "=== Move Semantics Demo ===" << std::endl;
    
    // Test 1: Basic construction
    std::cout << "\n--- Test 1: Basic construction ---" << std::endl;
    MoveTracker obj1("original");
    
    // Test 2: Copy construction
    std::cout << "\n--- Test 2: Copy construction ---" << std::endl;
    MoveTracker obj2 = obj1;  // Copy constructor
    
    // Test 3: Move construction
    std::cout << "\n--- Test 3: Move construction ---" << std::endl;
    MoveTracker obj3 = std::move(obj1);  // Move constructor
    
    // Test 4: Function return (RVO test)
    std::cout << "\n--- Test 4: Function return (RVO) ---" << std::endl;
    MoveTracker obj4 = create_object("returned");
    
    // Test 5: Perfect forwarding with lvalue
    std::cout << "\n--- Test 5: Perfect forwarding (lvalue) ---" << std::endl;
    process_object(obj2);
    
    // Test 6: Perfect forwarding with rvalue
    std::cout << "\n--- Test 6: Perfect forwarding (rvalue) ---" << std::endl;
    process_object(MoveTracker("temporary"));
    
    std::cout << "\n--- End of scope - destructors will be called ---" << std::endl;
}

int main() {
    move_semantics_demo();
    return 0;
}

// TODO: Predict the exact sequence of constructor/destructor calls
// This is complex! Think carefully about each operation.

// OUTPUT: === Move Semantics Demo ===
// OUTPUT: 
// OUTPUT: --- Test 1: Basic construction ---
// OUTPUT: ???  // What gets constructed?
// OUTPUT: 
// OUTPUT: --- Test 2: Copy construction ---
// OUTPUT: ???  // What type of construction happens?
// OUTPUT: 
// OUTPUT: --- Test 3: Move construction ---
// OUTPUT: ???  // What happens with std::move?
// OUTPUT: 
// OUTPUT: --- Test 4: Function return (RVO) ---
// OUTPUT: ???  // Does RVO eliminate copies? What gets constructed?
// OUTPUT: ???  // How many objects are actually created?
// OUTPUT: 
// OUTPUT: --- Test 5: Perfect forwarding (lvalue) ---
// OUTPUT: ???  // How is the lvalue forwarded?
// OUTPUT: ???  // What constructor is called in the template?
// OUTPUT: 
// OUTPUT: --- Test 6: Perfect forwarding (rvalue) ---
// OUTPUT: ???  // How is the temporary object handled?
// OUTPUT: ???  // What constructor calls happen?
// OUTPUT: 
// OUTPUT: --- End of scope - destructors will be called ---
// OUTPUT: ???  // Which objects get destroyed and in what order?

// TODO: Predict move semantics implementation in LLVM IR
// UNOPT: ???  // How are move constructors different from copy constructors in IR?
// UNOPT: ???  // How is std::move implemented?
// UNOPT: ???  // How does perfect forwarding template instantiation work?
// UNOPT: ???  // Will there be separate functions for T& and T&& versions?

// TODO: Predict optimization effects
// OPT: ???   // How does RVO affect the generated code?
// OPT: ???   // Will moves be optimized away completely?
// OPT: ???   // How will perfect forwarding be optimized?
// OPT: ???   // Will temporary objects be eliminated?

// TODO: This is the most advanced challenge - good luck!