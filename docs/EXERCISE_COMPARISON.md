# Exercise vs Solution: Understanding the Difference

## Why Does `01_hello_world.ll` Fail?

Let me show you the exact difference between the incomplete exercise and the working solution.

### The Error Message
```
error: expected instruction opcode
}
^
```

This error means LLVM found an empty function body with no actual instructions.

## Side-by-Side Comparison

### ❌ **Incomplete Exercise** (`01_hello_world.ll`)
```llvm
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; TODO: Declare the global string constant for "Hello, LLVM!\n"
; HINT: @hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1

; TODO: Declare the external printf function
; HINT: declare i32 @printf(ptr, ...)

; TODO: Complete the main function
define i32 @main() {
entry:
  ; TODO: Get a pointer to the string using getelementptr
  ; HINT: %str_ptr = getelementptr inbounds [14 x i8], ptr @hello_str, i32 0, i32 0
  
  ; TODO: Call printf with the string pointer
  ; HINT: call i32 @printf(ptr %str_ptr)
  
  ; TODO: Return 0
  ; HINT: ret i32 0
}
```

### ✅ **Working Solution** (`01_hello_world_SOLUTION.ll`)
```llvm
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; SOLUTION: Declare the global string constant for "Hello, LLVM!\n"
@hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1

; SOLUTION: Declare the external printf function
declare i32 @printf(ptr, ...)

; SOLUTION: Complete the main function
define i32 @main() {
entry:
  ; SOLUTION: Get a pointer to the string using getelementptr
  %str_ptr = getelementptr inbounds [14 x i8], ptr @hello_str, i32 0, i32 0
  
  ; SOLUTION: Call printf with the string pointer
  call i32 @printf(ptr %str_ptr)
  
  ; SOLUTION: Return 0
  ret i32 0
}
```

## What's Missing? (The Key Differences)

### 1. **Global String Declaration**
**Missing in exercise:**
```llvm
; TODO: Declare the global string constant for "Hello, LLVM!\n"
```

**Present in solution:**
```llvm
@hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1
```

**What this does:** Declares a global constant containing the string "Hello, LLVM!\n"

### 2. **Function Declaration**
**Missing in exercise:**
```llvm
; TODO: Declare the external printf function
```

**Present in solution:**
```llvm
declare i32 @printf(ptr, ...)
```

**What this does:** Tells LLVM about the external printf function from C library

### 3. **Function Body - String Pointer**
**Missing in exercise:**
```llvm
; TODO: Get a pointer to the string using getelementptr
```

**Present in solution:**
```llvm
%str_ptr = getelementptr inbounds [14 x i8], ptr @hello_str, i32 0, i32 0
```

**What this does:** Gets a pointer to the first character of the string

### 4. **Function Body - Function Call**
**Missing in exercise:**
```llvm
; TODO: Call printf with the string pointer
```

**Present in solution:**
```llvm
call i32 @printf(ptr %str_ptr)
```

**What this does:** Calls printf with the string pointer

### 5. **Function Body - Return Statement**
**Missing in exercise:**
```llvm
; TODO: Return 0
```

**Present in solution:**
```llvm
ret i32 0
```

**What this does:** Returns 0 from main function (success)

## The Testing Pipeline

### What lit Does:
1. **`; RUN: %llvm-as %s -o %t.bc`** - Compile LLVM IR to bytecode
2. **`; RUN: %lli %t.bc | %FileCheck %s`** - Execute bytecode and check output

### Where Each Version Fails/Succeeds:

#### ❌ **Exercise Version:**
```
Step 1: llvm-as tries to compile the IR
❌ FAILS: "expected instruction opcode" - empty function body
Step 2: Never reached
```

#### ✅ **Solution Version:**
```
Step 1: llvm-as compiles successfully ✅
Step 2: lli executes and prints "Hello, LLVM!" ✅
Step 3: FileCheck matches "Hello, LLVM!" against "; CHECK: Hello, LLVM!" ✅
```

## Understanding the Error

### Why "expected instruction opcode"?
In LLVM IR, every function must have at least one instruction in each basic block. The exercise has an empty `entry:` block:

```llvm
define i32 @main() {
entry:          ← This block is empty!
  ; TODO comments are not instructions
}
```

**Comments (`; TODO: ...`) are not instructions!** LLVM expects actual instructions like:
- `%var = getelementptr ...`
- `call i32 @printf(...)`
- `ret i32 0`

## How to Complete the Exercise

Replace each TODO comment with the corresponding HINT:

### Step 1: Add the global string
Replace:
```llvm
; TODO: Declare the global string constant for "Hello, LLVM!\n"
```
With:
```llvm
@hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1
```

### Step 2: Add the function declaration
Replace:
```llvm
; TODO: Declare the external printf function
```
With:
```llvm
declare i32 @printf(ptr, ...)
```

### Step 3: Add the getelementptr instruction
Replace:
```llvm
  ; TODO: Get a pointer to the string using getelementptr
```
With:
```llvm
  %str_ptr = getelementptr inbounds [14 x i8], ptr @hello_str, i32 0, i32 0
```

### Step 4: Add the function call
Replace:
```llvm
  ; TODO: Call printf with the string pointer
```
With:
```llvm
  call i32 @printf(ptr %str_ptr)
```

### Step 5: Add the return statement
Replace:
```llvm
  ; TODO: Return 0
```
With:
```llvm
  ret i32 0
```

## Testing Your Progress

After making changes, test with:
```bash
lit exercises/01_hello_world.ll
```

You'll see it progress from:
- ❌ Compilation error (empty function)
- ❌ Runtime error (missing declarations)  
- ❌ Output mismatch (wrong string)
- ✅ Success! (all parts working together)

This is exactly how the exercise system is designed to work - you learn by fixing each piece step by step!