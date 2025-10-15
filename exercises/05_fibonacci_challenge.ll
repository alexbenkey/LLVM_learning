; RUN: %llvm-as %s -o %t.bc  
; RUN: %lli %t.bc | %FileCheck %s

; CHALLENGE 5: Fibonacci Implementations
;
; GOAL: Implement BOTH recursive and iterative Fibonacci functions
; Then compare their performance and correctness
;
; REQUIREMENTS:
; 1. fibonacci_recursive(n) - recursive implementation
; 2. fibonacci_iterative(n) - iterative implementation  
; 3. main() that tests both with n=10 and prints results
; 4. Both functions must produce the same result
; 5. Time measurement (optional challenge)
;
; CONSTRAINTS:
; - No global variables allowed
; - Must handle edge cases (n=0, n=1)
; - Both functions must have identical signatures
; - Cannot use any libraries except printf
;
; RESEARCH SKILLS NEEDED:
; - Recursive function calls in LLVM IR
; - Tail recursion optimization
; - Loop-based algorithm implementation
; - Function calling conventions
; - Stack overflow considerations (why recursion can be dangerous)
;
; DIFFICULTY: ⭐⭐⭐⭐⭐

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; TODO: Declare external functions you need

; TODO: Implement recursive fibonacci
; Research: How does recursion work in LLVM IR?
; Consider: What are the base cases?
; Think: fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)

define i32 @fibonacci_recursive(i32 %n) {
entry:
  ; TODO: Handle base cases (n=0 returns 0, n=1 returns 1)
  
  ; TODO: Recursive case - call yourself with n-1 and n-2
  
  ; TODO: Add the results and return
}

; TODO: Implement iterative fibonacci  
; Research: How to implement loops with phi nodes?
; Think: Can you do this with just two variables tracking previous values?

define i32 @fibonacci_iterative(i32 %n) {
entry:
  ; TODO: Handle base cases
  
  ; TODO: Set up loop with phi nodes
  ; Track: current index, previous fibonacci value, current fibonacci value
  
  ; TODO: Loop until you reach n
  
  ; TODO: Return final result
}

; TODO: Implement main function
define i32 @main() {
entry:
  ; TODO: Test both functions with n=10
  ; TODO: Print results in expected format
  ; TODO: Verify both give same answer
  
  ret i32 0
}

; Expected output (fibonacci(10) = 55):
; CHECK: Testing Fibonacci implementations with n=10
; CHECK-NEXT: Recursive result: 55
; CHECK-NEXT: Iterative result: 55  
; CHECK-NEXT: Both implementations agree: SUCCESS