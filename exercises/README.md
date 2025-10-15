# LLVM IR Learning Exercises

This directory contains challenging exercises designed to teach you LLVM IR and modern C++ implementation through problem-solving and research. Unlike typical tutorials, these exercises require you to figure out solutions yourself - no hints are provided! You'll need to research documentation, experiment, and think critically about the problems.

## Two Complementary Track

### 🔧 **LLVM IR Track** (6 exercises)
Learn LLVM IR directly by implementing algorithms and solving puzzles at the instruction level.

### 🔮 **C++ Analysis Track** (6 exercises in `cpp/` subdirectory)
Understand how modern C++ features are implemented in LLVM IR by predicting compiler output.

## How to Use These Exercises

1. **Read the exercise file** - Each `.ll` file contains:
   - Clear learning objectives
   - Step-by-step instructions
   - TODO markers for code you need to complete
   - HINT comments with the exact syntax you need

2. **Complete the TODOs** - Fill in the missing LLVM IR code where marked

3. **Test your solution** - Run the exercise with lit:
   ```bash
   lit exercises/01_hello_world.ll
   ```

4. **Verify success** - The test passes when your code produces the expected output

## Exercise Progression

### Challenge 1: Reverse Engineering (`01_reverse_engineer.ll`)
**Topic:** Reverse Engineering from Expected Output
**Difficulty:** ⭐⭐☆☆☆
- Figure out what LLVM IR produces specific output
- No hints provided - deduce from CHECK lines
- Research printf usage and string formatting
- Understand basic arithmetic and output

**Skills you'll develop:**
- Reading and understanding CHECK patterns
- Researching LLVM IR syntax independently
- Problem-solving from incomplete information
- Basic printf and string handling

### Challenge 2: Optimization Detective (`02_optimization_detective.ll`)
**Topic:** Understanding Compiler Optimizations
**Difficulty:** ⭐⭐⭐☆☆
- Analyze inefficient LLVM IR code
- Predict what optimization passes will do
- Research sroa, early-cse, and instcombine passes
- Fill in CHECK patterns for optimized output

**Skills you'll develop:**
- Understanding LLVM optimization pipeline
- Analyzing redundant operations
- Memory-to-register promotion concepts
- Predicting compiler transformations

### Challenge 3: Control Flow Puzzle (`03_control_flow_puzzle.ll`)
**Topic:** Complex Branching and Command Line Arguments  
**Difficulty:** ⭐⭐⭐⭐☆
- Handle command line arguments in main()
- Implement multi-way branching logic
- Number categorization with complex rules
- Research argc/argv handling in LLVM IR

**Skills you'll develop:**
- Advanced control flow with multiple basic blocks
- Command line argument processing
- Complex conditional logic
- Integer comparison and modulo operations

### Challenge 4: Array Operations (`04_array_operations.ll`)
**Topic:** Dynamic Array Processing
**Difficulty:** ⭐⭐⭐⭐☆
- Implement array algorithms with loops
- Find maximum, sum, and count operations
- Use phi nodes for loop variables
- Cannot hardcode results - must compute them

**Skills you'll develop:**
- Array allocation and initialization
- Loop-based data processing
- Multiple accumulator variables
- Real algorithm implementation

### Challenge 5: Fibonacci Challenge (`05_fibonacci_challenge.ll`)
**Topic:** Recursive vs Iterative Algorithms
**Difficulty:** ⭐⭐⭐⭐⭐
- Implement both recursive AND iterative Fibonacci
- Compare performance and correctness
- Handle edge cases properly
- Research function calling overhead

**Skills you'll develop:**
- Recursive function implementation
- Loop-based alternatives to recursion
- Algorithm analysis and comparison
- Advanced function design

### Challenge 6: Struct Puzzle (`06_struct_puzzle.ll`)
**Topic:** Advanced Type System and Memory Management
**Difficulty:** ⭐⭐⭐⭐⭐
- Define custom struct types
- Implement heap allocation and pointer manipulation
- Mathematical operations (distance calculation)
- Memory management with malloc/free

**Skills you'll develop:**
- Custom type definitions in LLVM IR
- Pointer arithmetic and struct field access
- Memory allocation and deallocation
- Complex mathematical operations

## C++ Analysis Exercises

These exercises teach you how high-level C++ constructs are implemented in LLVM IR:

### Challenge C++0: Basic Functions ⭐⭐☆☆☆
- Gentle introduction to C++ → LLVM IR analysis
- Simple function calls and basic control flow
- Understanding the prediction process

### Challenge C++1: Template Detective
- Template instantiation and metaprogramming
- Compile-time vs runtime computation analysis
- Template name mangling in LLVM IR

### Challenge C++2: Virtual Function Dispatch ⭐⭐⭐⭐☆
- Polymorphism and virtual function table implementation
- Dynamic dispatch vs static calls
- Vtable structure in LLVM IR

### Challenge C++3: Exception Handling and RAII ⭐⭐⭐⭐⭐
- C++ exception implementation mechanisms
- Stack unwinding and cleanup
- LLVM IR exception handling constructs

### Challenge C++4: Lambda Closures ⭐⭐⭐⭐☆
- Lambda expression implementation as closures
- Different capture modes (value, reference, mutable)
- Closure optimization strategies

### Challenge C++5: Move Semantics and Perfect Forwarding ⭐⭐⭐⭐⭐
- Modern C++ performance features
- Move vs copy semantics in LLVM IR
- Return Value Optimization (RVO) analysis

## LLVM IR Reference

### Key Concepts

**SSA Form (Static Single Assignment):**
- Each variable is assigned exactly once
- Use phi nodes to merge values from different paths
- Variables are immutable after assignment

**Basic Blocks:**
- Sequences of instructions with single entry/exit points
- End with terminator instructions (`ret`, `br`)
- Connected by control flow

**Types:**
- `i32` - 32-bit integer
- `i1` - boolean (1-bit integer)
- `ptr` - pointer type
- `[n x type]` - array of n elements

### Common Instructions

**Memory Operations:**
```llvm
%var = alloca i32, align 4          ; Allocate local variable
store i32 42, ptr %var, align 4     ; Store value
%val = load i32, ptr %var, align 4  ; Load value
```

**Arithmetic:**
```llvm
%result = add i32 %a, %b    ; Addition
%result = sub i32 %a, %b    ; Subtraction  
%result = mul i32 %a, %b    ; Multiplication
```

**Comparisons:**
```llvm
%cmp = icmp eq i32 %a, %b   ; Equal
%cmp = icmp sgt i32 %a, %b  ; Signed greater than
%cmp = icmp slt i32 %a, %b  ; Signed less than
```

**Control Flow:**
```llvm
br label %block              ; Unconditional branch
br i1 %cond, label %then, label %else  ; Conditional branch
%val = phi i32 [ %v1, %block1 ], [ %v2, %block2 ]  ; Phi node
```

**Function Calls:**
```llvm
%result = call i32 @function(i32 %arg1, i32 %arg2)
```

## Running Exercises

```bash
# Run a specific exercise
lit -v exercises/01_hello_world.ll

# Run all exercises
lit exercises/

# Run exercises and see detailed output
lit -v exercises/

# Check which exercises are still incomplete
lit exercises/ | grep FAIL
```

## Tips for Success

1. **Start Simple:** Begin with exercise 1 and work through them in order
2. **Read Hints Carefully:** The HINT comments contain the exact syntax you need
3. **Understand Before Moving On:** Make sure you understand each concept before proceeding
4. **Experiment:** Try modifying the working code to see what happens
5. **Use the Reference:** Refer to the LLVM IR reference section above

## Debugging Tips

If a test fails:
1. **Check Syntax:** LLVM IR syntax is very strict
2. **Verify Variable Names:** Make sure you're using the right variable names
3. **Check Basic Block Structure:** Ensure proper branching between blocks
4. **Look at the Error Message:** lit will show you exactly what went wrong

## Next Steps

After completing these exercises, you'll have a solid foundation in LLVM IR. You can:
- Study the existing tests in the `tests/` directory
- Try writing your own LLVM IR programs from scratch  
- Explore more advanced LLVM features
- Learn about LLVM optimization passes