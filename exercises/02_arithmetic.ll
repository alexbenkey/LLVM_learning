; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; EXERCISE 2: Variables and Basic Arithmetic
;
; GOAL: Complete this LLVM IR program to perform arithmetic operations
;
; INSTRUCTIONS:
; 1. Fill in the missing arithmetic operations
; 2. Use alloca for local variables
; 3. Practice load/store operations
; 4. The result should be: (10 + 5) * 3 - 2 = 43
;
; LEARNING OBJECTIVES:
; - Learn about alloca, load, and store instructions
; - Practice integer arithmetic (add, mul, sub)
; - Understand local variable management in LLVM IR

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@format_str = private unnamed_addr constant [12 x i8] c"Result: %d\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  ; Allocate space for local variables
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %result = alloca i32, align 4
  
  ; Store initial values
  store i32 10, ptr %a, align 4
  store i32 5, ptr %b, align 4
  store i32 3, ptr %c, align 4
  store i32 2, ptr %d, align 4
  
  ; Load values for computation
  %val_a = load i32, ptr %a, align 4
  %val_b = load i32, ptr %b, align 4
  
  ; TODO: Add a and b (10 + 5 = 15)
  ; HINT: %add_result = add i32 %val_a, %val_b
  
  ; Load c for multiplication
  %val_c = load i32, ptr %c, align 4
  
  ; TODO: Multiply the sum by c (15 * 3 = 45)
  ; HINT: %mul_result = mul i32 %add_result, %val_c
  
  ; Load d for subtraction
  %val_d = load i32, ptr %d, align 4
  
  ; TODO: Subtract d from the product (45 - 2 = 43)
  ; HINT: %final_result = sub i32 %mul_result, %val_d
  
  ; Store the final result
  ; TODO: store i32 %final_result, ptr %result, align 4
  
  ; Load result for printing
  %print_val = load i32, ptr %result, align 4
  
  ; Print the result
  %str_ptr = getelementptr inbounds [12 x i8], ptr @format_str, i32 0, i32 0
  call i32 @printf(ptr %str_ptr, i32 %print_val)
  
  ret i32 0
}

; CHECK: Result: 43