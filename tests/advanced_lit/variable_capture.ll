; RUN: %opt -passes=sroa %s -S | %FileCheck %s

; EXAMPLE: Advanced FileCheck - Variable Capture and Reuse
; This demonstrates how to capture values and reuse them in subsequent checks

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define i32 @test_variable_capture() {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 10, ptr %x, align 4
  store i32 20, ptr %y, align 4
  %val_x = load i32, ptr %x, align 4
  %val_y = load i32, ptr %y, align 4
  %sum = add i32 %val_x, %val_y
  ret i32 %sum
}

; After SROA pass, allocas should be eliminated and we should see direct computation
; CHECK-LABEL: define i32 @test_variable_capture()
; CHECK-NOT: alloca

; Capture the first operand value in a variable called NUM1
; CHECK: %[[NUM1:[0-9]+]] = add i32 10, 20
; CHECK: ret i32 %[[NUM1]]

; Alternative approach - capture any register name
; Could also use: %[[SUM:[a-zA-Z0-9_.]+]] = add i32 10, 20