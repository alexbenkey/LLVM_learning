; RUN: %opt -passes="" %s -S | %FileCheck %s --check-prefix=UNOPT
; RUN: %opt -passes="function(sroa,early-cse)" %s -S | %FileCheck %s --check-prefix=OPT

; EXAMPLE: Multiple Check Prefixes
; This demonstrates testing different optimization levels in one file

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @redundant_computation() {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 5, ptr %a, align 4
  store i32 8, ptr %b, align 4
  
  ; First computation
  %val1_a = load i32, ptr %a, align 4
  %val1_b = load i32, ptr %b, align 4
  %sum1 = add i32 %val1_a, %val1_b
  
  ; Redundant computation (same values)
  %val2_a = load i32, ptr %a, align 4
  %val2_b = load i32, ptr %b, align 4
  %sum2 = add i32 %val2_a, %val2_b
  
  %total = add i32 %sum1, %sum2
  ret i32 %total
}

; Unoptimized version should have all allocas and redundant operations
; UNOPT-LABEL: define i32 @redundant_computation()
; UNOPT: %a = alloca i32
; UNOPT: %b = alloca i32
; UNOPT: store i32 5, ptr %a
; UNOPT: store i32 8, ptr %b
; UNOPT: %val1_a = load i32, ptr %a
; UNOPT: %val1_b = load i32, ptr %b
; UNOPT: %sum1 = add i32 %val1_a, %val1_b
; UNOPT: %val2_a = load i32, ptr %a
; UNOPT: %val2_b = load i32, ptr %b
; UNOPT: %sum2 = add i32 %val2_a, %val2_b

; Optimized version should eliminate allocas and redundant computations
; OPT-LABEL: define i32 @redundant_computation()
; OPT-NOT: alloca
; OPT-NOT: load
; OPT-NOT: store
; OPT: ret i32 26