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

@.str = private unnamed_addr constant [18 x i8] c"The answer is %d\0A\00", align 1

@.str2 = private unnamed_addr constant [27 x i8] c"Calculation: %d * %d = %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 6, i32* %x, align 4
  store i32 7, i32* %y, align 4
  %x_val = load i32, i32* %x, align 4
  %y_val = load i32, i32* %y, align 4
  %result = mul i32 %x_val, %y_val
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), i32 %result)
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str2, i32 0, i32 0), i32 %x_val, i32 %y_val, i32 %result)
  ret i32 0
}

; Expected output - figure out what the function should do!
; CHECK: The answer is 42
; CHECK-NEXT: Calculation: 6 * 7 = 42