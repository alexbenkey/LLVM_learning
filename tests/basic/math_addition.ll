; RUN: llvm-as %s -o %t.bc
; RUN: lli %t.bc | FileCheck %s

; Simple addition test: 5 + 3 = 8
; CHECK: 8

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %a = add i32 5, 3
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %a)
  ret i32 0
}