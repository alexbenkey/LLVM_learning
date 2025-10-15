; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; CHALLENGE 4: Array Operations
;
; GOAL: Implement a program that:
; 1. Creates an array of integers: [3, 7, 1, 9, 4]
; 2. Finds the maximum value
; 3. Calculates the sum of all elements
; 4. Counts how many elements are greater than 5
; 5. Prints all results in the specified format
;
; CONSTRAINTS:
; - Must use a loop to process the array (no unrolling!)
; - Must use getelementptr for array access
; - Cannot hardcode the results - must actually compute them
; - Array size must be stored in a variable, not hardcoded in loop
;
; RESEARCH SKILLS NEEDED:
; - Array allocation and initialization in LLVM IR
; - Loop construction with phi nodes
; - Pointer arithmetic with getelementptr
; - Comparison and conditional logic in loops
; - Variable management in SSA form
;
; DIFFICULTY: ⭐⭐⭐⭐☆

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; TODO: Declare any external functions you need

define i32 @main() {
entry:
  ; TODO: Create and initialize array [3, 7, 1, 9, 4]
  ; Research: How to declare and initialize arrays in LLVM IR
  
  ; TODO: Initialize variables for max, sum, and count
  
  ; TODO: Create loop to process array
  ; Must use phi nodes for loop variables
  
  ; TODO: In loop body:
  ; - Load current array element
  ; - Update max if current > max
  ; - Add to sum
  ; - Increment count if element > 5
  
  ; TODO: Print results in the format expected by CHECK lines
  
  ret i32 0
}

; Expected output:
; CHECK: Array: [3, 7, 1, 9, 4]
; CHECK-NEXT: Maximum: 9
; CHECK-NEXT: Sum: 24
; CHECK-NEXT: Elements > 5: 2