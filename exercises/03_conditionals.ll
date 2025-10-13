; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; EXERCISE 3: Conditional Branches and Comparisons
;
; GOAL: Complete this LLVM IR program to implement conditional logic
;
; INSTRUCTIONS:
; 1. Fill in the missing comparison and branch instructions
; 2. Implement an if-else structure that checks if a number is positive
; 3. Print different messages based on the condition
;
; LEARNING OBJECTIVES:
; - Learn about icmp (integer comparison) instruction
; - Practice conditional branching with br instruction
; - Understand basic block structure and control flow

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@positive_msg = private unnamed_addr constant [20 x i8] c"Number is positive\0A\00", align 1
@negative_msg = private unnamed_addr constant [28 x i8] c"Number is zero or negative\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  ; Test with the number 42
  %number = alloca i32, align 4
  store i32 42, ptr %number, align 4
  %val = load i32, ptr %number, align 4
  
  ; TODO: Compare the number with 0 (check if positive)
  ; HINT: %is_positive = icmp sgt i32 %val, 0
  
  ; TODO: Branch based on the comparison result
  ; HINT: br i1 %is_positive, label %positive, label %negative
  
positive:
  ; Print positive message
  %pos_str = getelementptr inbounds [20 x i8], ptr @positive_msg, i32 0, i32 0
  call i32 @printf(ptr %pos_str)
  ; TODO: Branch to exit block
  ; HINT: br label %exit
  
negative:
  ; Print negative message  
  %neg_str = getelementptr inbounds [28 x i8], ptr @negative_msg, i32 0, i32 0
  call i32 @printf(ptr %neg_str)
  ; TODO: Branch to exit block
  ; HINT: br label %exit
  
exit:
  ret i32 0
}

; CHECK: Number is positive