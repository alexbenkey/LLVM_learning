; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; EXERCISE 5: Functions and Function Calls
;
; GOAL: Complete this LLVM IR program to implement and call custom functions
;
; INSTRUCTIONS:
; 1. Complete the multiply function that takes two i32 parameters
; 2. Complete the factorial function that calculates factorial recursively
; 3. Call both functions from main and print their results
;
; LEARNING OBJECTIVES:
; - Learn function definition syntax and parameter handling
; - Practice function calls with arguments and return values
; - Understand recursive function calls

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@mult_format = private unnamed_addr constant [13 x i8] c"6 * 7 = %d\0A\00", align 1
@fact_format = private unnamed_addr constant [17 x i8] c"Factorial 5 = %d\0A\00", align 1

declare i32 @printf(ptr, ...)

; TODO: Complete the multiply function
; Takes two i32 parameters and returns their product
define i32 @multiply(i32 %a, i32 %b) {
entry:
  ; TODO: Multiply the parameters and return the result
  ; HINT: %result = mul i32 %a, %b
  ; HINT: ret i32 %result
}

; TODO: Complete the factorial function
; Calculates n! recursively
define i32 @factorial(i32 %n) {
entry:
  ; TODO: Check if n is 0 or 1 (base case)
  ; HINT: %is_base = icmp sle i32 %n, 1
  ; HINT: br i1 %is_base, label %base_case, label %recursive_case
  
base_case:
  ; TODO: Return 1 for base case
  ; HINT: ret i32 1
  
recursive_case:
  ; TODO: Calculate (n-1) and call factorial recursively
  ; HINT: %n_minus_1 = sub i32 %n, 1
  ; HINT: %fact_n_minus_1 = call i32 @factorial(i32 %n_minus_1)
  
  ; TODO: Multiply n by factorial(n-1) and return
  ; HINT: %result = mul i32 %n, %fact_n_minus_1
  ; HINT: ret i32 %result
}

define i32 @main() {
entry:
  ; Test multiply function: 6 * 7
  ; TODO: Call multiply function with 6 and 7
  ; HINT: %mult_result = call i32 @multiply(i32 6, i32 7)
  
  ; Print multiply result
  %mult_str = getelementptr inbounds [13 x i8], ptr @mult_format, i32 0, i32 0
  call i32 @printf(ptr %mult_str, i32 %mult_result)
  
  ; Test factorial function: 5!
  ; TODO: Call factorial function with 5
  ; HINT: %fact_result = call i32 @factorial(i32 5)
  
  ; Print factorial result
  %fact_str = getelementptr inbounds [17 x i8], ptr @fact_format, i32 0, i32 0
  call i32 @printf(ptr %fact_str, i32 %fact_result)
  
  ret i32 0
}

; CHECK: 6 * 7 = 42
; CHECK-NEXT: Factorial 5 = 120