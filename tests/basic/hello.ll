; RUN: llvm-as %s -o %t.bc
; RUN: lli %t.bc | FileCheck %s

; Simple hello world program in LLVM IR
; CHECK: Hello, LLVM Lit!

@.str = private unnamed_addr constant [17 x i8] c"Hello, LLVM Lit!\00", align 1

declare i32 @puts(i8*)

define i32 @main() {
entry:
  %call = call i32 @puts(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0))
  ret i32 0
}