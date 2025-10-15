; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; CHALLENGE 1: Reverse Engineering
; 
; GOAL: Make this program output exactly what the CHECK lines expect
; 
; CONSTRAINTS:
; - You can ONLY modify the function body (between { and })
; - You cannot change the function signature
; - You must use EXACTLY these variable names: %x, %y, %result
; - No hints provided - figure it out from the expected output!
;
; RESEARCH SKILLS NEEDED:
; - LLVM IR arithmetic instructions
; - Integer literals and operations
; - Function return values
; - printf format strings (if you choose to use printf)
;
; DIFFICULTY: ⭐⭐☆☆☆

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; You may declare external functions here if needed

define i32 @mystery_function() {
entry:
  ; TODO: Write LLVM IR that produces the expected output
  ; Available variable names you MUST use: %x, %y, %result
  ; Figure out what operations are needed from the CHECK lines below
  
  ; Your code goes here...
  
}

; Expected output - figure out what the function should do!
; CHECK: The answer is 42
; CHECK-NEXT: Calculation: 6 * 7 = 42