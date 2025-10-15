; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc 5 | %FileCheck %s --check-prefix=TEST1
; RUN: %lli %t.bc 0 | %FileCheck %s --check-prefix=TEST2
; RUN: %lli %t.bc -3 | %FileCheck %s --check-prefix=TEST3
; RUN: %lli %t.bc 100 | %FileCheck %s --check-prefix=TEST4

; CHALLENGE 3: Control Flow Puzzle
;
; GOAL: Implement a function that categorizes numbers based on complex rules:
; - If number is 0: print "ZERO"
; - If number is positive and even: print "POSITIVE EVEN"
; - If number is positive and odd: print "POSITIVE ODD"  
; - If number is negative: print "NEGATIVE"
; - If number > 50: print "BIG" (regardless of even/odd)
;
; CONSTRAINTS:
; - Must use proper basic block structure
; - Must use icmp for comparisons
; - Must use br for branching
; - Must handle command line argument as input
; - Figure out the main() signature yourself!
;
; RESEARCH SKILLS NEEDED:
; - LLVM IR control flow (basic blocks, branching)
; - Integer comparison operations
; - Command line argument handling in LLVM IR
; - Modulo operations for even/odd detection
; - Complex multi-way branching logic
;
; DIFFICULTY: ⭐⭐⭐⭐☆

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; You'll need to declare external functions - research which ones!

; TODO: Implement the main function
; Figure out the signature for handling command line arguments
; Research: How does main() work in LLVM IR when it takes arguments?

define ??? @main(???) {
entry:
  ; TODO: Extract the number from command line arguments
  ; Research: atoi function, argv handling, etc.
  
  ; TODO: Implement the categorization logic
  ; Create basic blocks for each case
  ; Use icmp and br instructions
  
  ; TODO: Handle each case with appropriate output
  
  ; TODO: Return appropriate exit code
}

; Test cases - your implementation should pass all of these:
; TEST1: POSITIVE ODD
; TEST2: ZERO  
; TEST3: NEGATIVE
; TEST4: BIG