// RUN: %clang++ -S -emit-llvm -O0 %s -o %t-O0.ll
// RUN: %clang++ -S -emit-llvm -O2 %s -o %t-O2.ll
// RUN: %FileCheck %s --check-prefix=UNOPT --input-file=%t-O0.ll
// RUN: %FileCheck %s --check-prefix=OPT --input-file=%t-O2.ll

// This test demonstrates checking LLVM IR patterns generated from C++
// We compile with different optimization levels and verify the IR

int compute_constant() {
    int x = 10;
    int y = 32;
    return x + y;  // Should be folded to constant 42 in optimized version
}

int main() {
    return compute_constant();
}

// UNOPT: define {{.*}} @_Z16compute_constantv()
// UNOPT: alloca i32
// UNOPT: alloca i32
// UNOPT: store i32 10, ptr
// UNOPT: store i32 32, ptr
// UNOPT: add nsw i32

// OPT: define {{.*}} @_Z16compute_constantv()
// OPT: ret i32 42
