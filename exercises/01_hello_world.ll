; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; EXERCISE 1: Basic LLVM IR Structure - Hello World
; 
; GOAL: Complete this LLVM IR program to print "Hello, LLVM!" to stdout
; 
; INSTRUCTIONS:
; 1. Fill in the missing parts marked with "TODO"
; 2. Use the printf function to print the string
; 3. The test will pass when the output matches the CHECK line
;
; LEARNING OBJECTIVES:
; - Understand basic LLVM IR structure (target info, global strings, functions)
; - Learn about external function declarations
; - Practice basic function calls and return values

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; TODO: Declare the global string constant for "Hello, LLVM!\n"
; HINT: @hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1

; TODO: Declare the external printf function
; HINT: declare i32 @printf(ptr, ...)

; TODO: Complete the main function
define i32 @main() {
entry:
  ; TODO: Get a pointer to the string using getelementptr
  ; HINT: %str_ptr = getelementptr inbounds [14 x i8], ptr @hello_str, i32 0, i32 0
  
  ; TODO: Call printf with the string pointer
  ; HINT: call i32 @printf(ptr %str_ptr)
  
  ; TODO: Return 0
  ; HINT: ret i32 0
}

; CHECK: Hello, LLVM!