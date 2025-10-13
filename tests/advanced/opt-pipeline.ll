; RUN: opt -passes="function(sroa,early-cse)" %s -S | FileCheck %s
; RUN: opt -passes="default<O2>" %s -S | FileCheck %s --check-prefix=O2

; Test optimization pipeline effects
; This demonstrates how different optimization passes affect the IR

define i32 @test_function(i32 %x, i32 %y) {
entry:
  %temp = alloca i32, align 4
  store i32 %x, i32* %temp, align 4
  %loaded = load i32, i32* %temp, align 4
  %result = add i32 %loaded, %y
  ret i32 %result
}

; CHECK-LABEL: @test_function
; After SROA and early CSE, the alloca should be eliminated
; CHECK-NOT: alloca
; CHECK-NOT: store
; CHECK-NOT: load
; CHECK: add i32 %x, %y

; O2: @test_function
; With O2 optimization, function should be optimized further
; O2: add i32 %x, %y