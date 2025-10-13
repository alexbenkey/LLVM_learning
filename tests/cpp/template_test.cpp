// RUN: %clang++ -S -emit-llvm %s -o %t.ll
// RUN: %FileCheck %s --input-file=%t.ll

// This test demonstrates C++ template instantiation in LLVM IR

template<typename T>
T multiply(T a, T b) {
    return a * b;
}

// Function to ensure template instantiation
int test_int() {
    return multiply<int>(6, 7);
}

double test_double() {
    return multiply<double>(2.5, 4.0);
}

int main() {
    test_int();
    test_double();
    return 0;
}

// Check that both template instantiations are present
// CHECK: define {{.*}} @_Z8multiplyIiET_S0_S0_
// CHECK: mul nsw i32
// CHECK: define {{.*}} @_Z8multiplyIdET_S0_S0_
// CHECK: fmul double
