; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; EXERCISE 4: Loops and Phi Nodes
;
; GOAL: Complete this LLVM IR program to implement a simple counting loop
;
; INSTRUCTIONS:
; 1. Fill in the missing phi nodes and loop logic
; 2. Implement a loop that counts from 1 to 5
; 3. Print each number during the loop
;
; LEARNING OBJECTIVES:
; - Learn about phi nodes for SSA form
; - Practice loop construction with basic blocks
; - Understand how values merge from different control flow paths

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@format_str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  br label %loop_start

loop_start:
  ; TODO: Create a phi node to track the loop counter
  ; The counter should start at 1 (from entry) and increment each iteration
  ; HINT: %counter = phi i32 [ 1, %entry ], [ %next_counter, %loop_body ]
  
  ; Check if we should continue the loop (counter <= 5)
  %continue = icmp sle i32 %counter, 5
  
  ; TODO: Branch based on the condition
  ; HINT: br i1 %continue, label %loop_body, label %loop_end
  
loop_body:
  ; Print the current counter value
  %str_ptr = getelementptr inbounds [4 x i8], ptr @format_str, i32 0, i32 0
  call i32 @printf(ptr %str_ptr, i32 %counter)
  
  ; TODO: Increment the counter
  ; HINT: %next_counter = add i32 %counter, 1
  
  ; TODO: Jump back to loop start
  ; HINT: br label %loop_start
  
loop_end:
  ret i32 0
}

; CHECK: 1
; CHECK-NEXT: 2
; CHECK-NEXT: 3
; CHECK-NEXT: 4
; CHECK-NEXT: 5