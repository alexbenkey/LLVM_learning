; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; EXERCISE 1 SOLUTION: Basic LLVM IR Structure - Hello World
; 
; This is the completed version showing all TODOs filled in

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; SOLUTION: Declare the global string constant for "Hello, LLVM!\n"
@hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1

; SOLUTION: Declare the external printf function
declare i32 @printf(ptr, ...)

; SOLUTION: Complete the main function
define i32 @main() {
entry:
  ; SOLUTION: Get a pointer to the string using getelementptr
  %str_ptr = getelementptr inbounds [14 x i8], ptr @hello_str, i32 0, i32 0
  
  ; SOLUTION: Call printf with the string pointer
  call i32 @printf(ptr %str_ptr)
  
  ; SOLUTION: Return 0
  ret i32 0
}

; CHECK: Hello, LLVM!