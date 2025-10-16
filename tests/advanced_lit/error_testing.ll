; RUN: not %llvm-as %s -o /dev/null 2>&1 | %FileCheck %s

; EXAMPLE: Error Message Testing
; This demonstrates testing for expected errors using "not" command
; The "not" command inverts the exit status - success becomes failure, failure becomes success

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; This function has intentional errors that should cause llvm-as to fail
define i32 @intentional_errors() {
entry:
  ; Error 1: Using undefined variable
  %result = add i32 %undefined_var, 42
  
  ; Error 2: Type mismatch
  %bad_add = add i32 %result, 3.14
  
  ret i32 %result
}

; Check that we get the expected error messages
; CHECK: floating point constant invalid for type
