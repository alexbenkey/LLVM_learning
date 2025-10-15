; RUN: %opt -passes="" %s -S | %FileCheck %s --check-prefix=UNOPT
; RUN: %opt -passes="function(sroa,early-cse,instcombine)" %s -S | %FileCheck %s --check-prefix=OPT

; CHALLENGE 2: Optimization Detective
;
; GOAL: This code is intentionally inefficient. Your job is to:
; 1. Understand what the unoptimized code does
; 2. Research what the optimization passes will do to it
; 3. Predict what the optimized version should look like
; 4. Fill in the CHECK patterns to match the optimized output
;
; RESEARCH SKILLS NEEDED:
; - Understanding LLVM optimization passes (sroa, early-cse, instcombine)
; - Analyzing redundant operations
; - Memory-to-register promotion
; - Constant folding and propagation
;
; DIFFICULTY: ⭐⭐⭐☆☆

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @inefficient_code(i32 %input) {
entry:
  ; This code is intentionally wasteful
  %temp1 = alloca i32, align 4
  %temp2 = alloca i32, align 4
  %temp3 = alloca i32, align 4
  
  ; Store the input
  store i32 %input, ptr %temp1, align 4
  
  ; Load it back (redundant!)
  %val1 = load i32, ptr %temp1, align 4
  
  ; Do some math
  %calc1 = add i32 %val1, 10
  
  ; Store intermediate result
  store i32 %calc1, ptr %temp2, align 4
  
  ; Load it back (redundant!)
  %val2 = load i32, ptr %temp2, align 4
  
  ; More redundant operations
  %calc2 = mul i32 %val2, 1  ; Multiply by 1!
  %calc3 = add i32 %calc2, 0  ; Add 0!
  
  ; Store final result
  store i32 %calc3, ptr %temp3, align 4
  
  ; Load it back one more time (redundant!)
  %final = load i32, ptr %temp3, align 4
  
  ret i32 %final
}

; Check what the unoptimized version looks like (should match the original)
; UNOPT-LABEL: define i32 @inefficient_code
; UNOPT: alloca i32
; UNOPT: store i32 %input
; UNOPT: load i32
; UNOPT: ret i32

; TODO: Fill in what you think the optimized version will look like
; Research the optimization passes and predict the result
; HINT: Think about what sroa (scalar replacement of aggregates) does
; HINT: Think about what early-cse (early common subexpression elimination) does
; HINT: Think about what instcombine (instruction combining) does

; OPT-LABEL: define i32 @inefficient_code
; OPT: ???  ; What do you think this will be after optimization?
; OPT: ???  ; Will there be any allocas left?
; OPT: ???  ; What will the final instruction look like?

; TODO: Replace the ??? above with your predictions
; Run the test to see if you're right!