; RUN: %llvm-as %s -o %t.bc
; RUN: %lli %t.bc | %FileCheck %s

; CHALLENGE 6: Struct and Pointer Manipulation
;
; GOAL: Implement a simple "Point" struct with operations
; 
; REQUIREMENTS:
; 1. Define a Point struct with x, y coordinates (i32)
; 2. Implement create_point(x, y) -> returns pointer to Point
; 3. Implement distance_from_origin(point) -> returns distance
; 4. Implement move_point(point, dx, dy) -> modifies point in place
; 5. Demonstrate usage in main()
;
; MATH NOTE: distance = sqrt(x² + y²) 
; You can approximate sqrt or research LLVM intrinsics
;
; CONSTRAINTS:
; - Must allocate Point on heap (use malloc/free if available)
; - Must use proper struct indexing with getelementptr
; - Must demonstrate passing structs by pointer
; - Handle memory management properly
;
; RESEARCH SKILLS NEEDED:
; - LLVM IR struct types and layout
; - Memory allocation (malloc/free or alloca)
; - Pointer dereferencing and struct field access
; - Mathematical operations and type conversions
; - Function parameter passing by reference
;
; DIFFICULTY: ⭐⭐⭐⭐⭐

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; TODO: Define the Point struct type
; Research: How to define custom types in LLVM IR
; Hint: Look up %struct.Point = type { ... }

; TODO: Declare external functions (malloc, free, printf, sqrt?, etc.)

; TODO: Implement create_point function
; Should allocate memory for a Point and initialize x, y values
define ptr @create_point(i32 %x, i32 %y) {
entry:
  ; TODO: Allocate memory for Point struct
  ; TODO: Get pointers to x and y fields  
  ; TODO: Store the x and y values
  ; TODO: Return pointer to the Point
}

; TODO: Implement distance_from_origin function
; Calculate sqrt(x² + y²)
define double @distance_from_origin(ptr %point) {
entry:
  ; TODO: Load x and y values from the struct
  ; TODO: Calculate x² and y²
  ; TODO: Add them together
  ; TODO: Calculate square root (research LLVM sqrt intrinsic or approximate)
  ; TODO: Return the distance
}

; TODO: Implement move_point function  
; Modifies the point by adding dx, dy to current coordinates
define void @move_point(ptr %point, i32 %dx, i32 %dy) {
entry:
  ; TODO: Load current x and y values
  ; TODO: Add dx to x, dy to y
  ; TODO: Store new values back to the struct
}

; TODO: Implement main function to demonstrate usage
define i32 @main() {
entry:
  ; TODO: Create a point at (3, 4)
  ; TODO: Print initial coordinates
  ; TODO: Calculate and print distance from origin
  ; TODO: Move point by (1, 1)
  ; TODO: Print new coordinates  
  ; TODO: Calculate and print new distance
  ; TODO: Clean up memory if using malloc
  
  ret i32 0
}

; Expected output:
; CHECK: Created point at (3, 4)
; CHECK-NEXT: Distance from origin: 5.00
; CHECK-NEXT: After moving by (1, 1): (4, 5)
; CHECK-NEXT: New distance from origin: 6.40