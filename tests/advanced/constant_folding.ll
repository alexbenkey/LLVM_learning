; RUN: opt -passes="function(instcombine)" %s -S | FileCheck %s

; Test constant folding optimization
; The optimizer should fold constant expressions at compile time

define i32 @constant_math() {
entry:
  ; These constant operations should be folded into a single constant
  %a = add i32 10, 20        ; 30
  %b = mul i32 %a, 2         ; 60
  %c = sub i32 %b, 15        ; 45
  ret i32 %c
}

; CHECK-LABEL: @constant_math
; CHECK: ret i32 45
; CHECK-NOT: add
; CHECK-NOT: mul
; CHECK-NOT: sub