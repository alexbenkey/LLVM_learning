; RUN: llvm-as %s -o %t.bc
; RUN: lli %t.bc | FileCheck %s

; Complex math test: (5 + 3) * 2 - 4 = 12
; CHECK: 12

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %add = add i32 5, 3        ; 5 + 3 = 8
  %mul = mul i32 %add, 2     ; 8 * 2 = 16
  %result = sub i32 %mul, 4  ; 16 - 4 = 12
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %result)
  ret i32 0
}