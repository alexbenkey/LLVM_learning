; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; EXERCISE 6: Arrays and Getelementptr
;
; GOAL: Complete this LLVM IR program to work with arrays
;
; INSTRUCTIONS:
; 1. Complete the array initialization and access operations
; 2. Calculate the sum of array elements using a loop
; 3. Use getelementptr to access array elements by index
;
; LEARNING OBJECTIVES:
; - Learn about arrays and getelementptr instruction
; - Practice array indexing and pointer arithmetic
; - Combine arrays with loops for processing

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@format_str = private unnamed_addr constant [17 x i8] c"Sum of array: %d\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  ; Create an array of 5 integers
  %array = alloca [5 x i32], align 16
  
  ; Initialize array elements: [10, 20, 30, 40, 50]
  ; Element 0: array[0] = 10
  ; TODO: Get pointer to first element and store 10
  ; HINT: %elem0_ptr = getelementptr inbounds [5 x i32], ptr %array, i32 0, i32 0
  ; HINT: store i32 10, ptr %elem0_ptr, align 4
  
  ; Element 1: array[1] = 20
  ; TODO: Get pointer to second element and store 20
  ; HINT: %elem1_ptr = getelementptr inbounds [5 x i32], ptr %array, i32 0, i32 1
  ; HINT: store i32 20, ptr %elem1_ptr, align 4
  
  ; Element 2: array[2] = 30
  %elem2_ptr = getelementptr inbounds [5 x i32], ptr %array, i32 0, i32 2
  store i32 30, ptr %elem2_ptr, align 4
  
  ; Element 3: array[3] = 40
  %elem3_ptr = getelementptr inbounds [5 x i32], ptr %array, i32 0, i32 3
  store i32 40, ptr %elem3_ptr, align 4
  
  ; Element 4: array[4] = 50
  %elem4_ptr = getelementptr inbounds [5 x i32], ptr %array, i32 0, i32 4
  store i32 50, ptr %elem4_ptr, align 4
  
  ; Initialize loop variables
  %sum = alloca i32, align 4
  store i32 0, ptr %sum, align 4
  
  br label %loop_start

loop_start:
  ; Loop counter (index)
  %index = phi i32 [ 0, %entry ], [ %next_index, %loop_body ]
  
  ; Check if we should continue (index < 5)
  %continue = icmp slt i32 %index, 5
  br i1 %continue, label %loop_body, label %loop_end

loop_body:
  ; TODO: Get pointer to current array element
  ; HINT: %current_ptr = getelementptr inbounds [5 x i32], ptr %array, i32 0, i32 %index
  
  ; TODO: Load the current element value
  ; HINT: %current_value = load i32, ptr %current_ptr, align 4
  
  ; Add current value to sum
  %current_sum = load i32, ptr %sum, align 4
  ; TODO: Add current value to the sum
  ; HINT: %new_sum = add i32 %current_sum, %current_value
  ; HINT: store i32 %new_sum, ptr %sum, align 4
  
  ; Increment index
  %next_index = add i32 %index, 1
  br label %loop_start

loop_end:
  ; Print the final sum
  %final_sum = load i32, ptr %sum, align 4
  %str_ptr = getelementptr inbounds [17 x i8], ptr @format_str, i32 0, i32 0
  call i32 @printf(ptr %str_ptr, i32 %final_sum)
  
  ret i32 0
}

; CHECK: Sum of array: 150