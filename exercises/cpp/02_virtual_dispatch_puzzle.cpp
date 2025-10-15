// RUN: %clang++ -S -emit-llvm %s -o %t.ll
// RUN: %clang++ %s -o %t.exe
// RUN: %t.exe | %FileCheck %s --check-prefix=OUTPUT
// RUN: %FileCheck %s --check-prefix=IR --input-file=%t.ll

// CHALLENGE C++2: Virtual Function Dispatch Puzzle
//
// GOAL: Understand how C++ virtual functions are implemented in LLVM IR
//
// TASK: You have this C++ code with virtual inheritance. Your job is to:
// 1. Predict the runtime behavior (what gets printed)
// 2. Understand how vtables are represented in LLVM IR
// 3. Fill in CHECK patterns to match both output and IR structure
// 4. Identify virtual vs non-virtual calls in the IR
//
// CONSTRAINTS:
// - Cannot modify the C++ code
// - Must understand polymorphism implementation details
// - Must research vtable structure in LLVM IR
//
// RESEARCH SKILLS NEEDED:
// - Virtual function table (vtable) implementation
// - Dynamic dispatch vs static dispatch
// - LLVM IR vtable representation
// - Virtual inheritance overhead analysis
//
// DIFFICULTY: ⭐⭐⭐⭐☆

#include <iostream>
#include <memory>

class Shape {
public:
    virtual ~Shape() = default;
    virtual void draw() const { std::cout << "Drawing generic shape" << std::endl; }
    virtual double area() const = 0;
    void info() const { std::cout << "This is a shape"; }  // Non-virtual!
};

class Circle : public Shape {
private:
    double radius;
public:
    Circle(double r) : radius(r) {}
    void draw() const override { std::cout << "Drawing circle with radius " << radius << std::endl; }
    double area() const override { return 3.14159 * radius * radius; }
};

class Rectangle : public Shape {
private:
    double width, height;
public:
    Rectangle(double w, double h) : width(w), height(h) {}
    void draw() const override { std::cout << "Drawing rectangle " << width << "x" << height << std::endl; }
    double area() const override { return width * height; }
};

void polymorphic_test() {
    std::unique_ptr<Shape> shapes[] = {
        std::make_unique<Circle>(5.0),
        std::make_unique<Rectangle>(4.0, 6.0)
    };
    
    for (const auto& shape : shapes) {
        shape->draw();      // Virtual call
        shape->info();      // Non-virtual call
        std::cout << " with area " << shape->area() << std::endl;  // Virtual call
    }
}

int main() {
    polymorphic_test();
    return 0;
}

// TODO: Predict what this program will output
// Think about: Which version of each method gets called?

// OUTPUT: ???  // What does Circle::draw() print?
// OUTPUT: ???  // What does the non-virtual info() print?
// OUTPUT: ???  // What does Circle::area() return?
// OUTPUT: ???  // What does Rectangle::draw() print?
// OUTPUT: ???  // What does the non-virtual info() print again?
// OUTPUT: ???  // What does Rectangle::area() return?

// TODO: Predict what the LLVM IR will contain
// Research: How are vtables represented in LLVM IR?
// Think: What's the difference between virtual and non-virtual calls?

// IR: ???  // Will there be vtable definitions? What do they look like?
// IR: ???  // How are virtual function calls implemented?
// IR: ???  // Will you see load instructions for vtable lookups?
// IR: ???  // How is the non-virtual info() call different?

// TODO: Replace all ??? with your predictions
// Run the test and compare with actual output and IR!