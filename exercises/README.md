# LLVM IR Learning Exercises

This directory contains progressive exercises designed to teach you LLVM IR fundamentals through hands-on practice. Each exercise is a partially complete LLVM IR program with TODO sections for you to fill in. The exercises integrate with your lit testing framework, so tests will pass when you complete them correctly.

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

### Exercise 1: Hello World (`01_hello_world.ll`)
**Topic:** Basic LLVM IR Structure
- Global string constants
- External function declarations
- Basic function structure
- Function calls and return values

**Skills learned:**
- `@global_var` syntax for globals
- `declare` for external functions
- `define` for function definitions
- `getelementptr` for string access
- `call` instruction
- `ret` instruction

### Exercise 2: Arithmetic (`02_arithmetic.ll`)
**Topic:** Variables and Basic Arithmetic
- Local variable allocation
- Load and store operations
- Integer arithmetic operations

**Skills learned:**
- `alloca` for local variables
- `load` and `store` instructions
- `add`, `mul`, `sub` arithmetic instructions
- Variable alignment concepts

### Exercise 3: Conditionals (`03_conditionals.ll`)
**Topic:** Conditional Branches and Comparisons
- Integer comparisons
- Conditional branching
- Basic block structure

**Skills learned:**
- `icmp` instruction and comparison predicates (`sgt`, `slt`, etc.)
- `br` conditional and unconditional branching
- Basic block labels and control flow
- SSA form principles

### Exercise 4: Loops (`04_loops.ll`)
**Topic:** Loops and Phi Nodes
- Loop construction
- Phi nodes for SSA form
- Control flow with multiple basic blocks

**Skills learned:**
- `phi` nodes for value merging
- Loop structure with basic blocks
- SSA form in practice
- Complex control flow patterns

### Exercise 5: Functions (`05_functions.ll`)
**Topic:** Functions and Function Calls
- Function definitions with parameters
- Function calls with arguments
- Recursive functions
- Return values

**Skills learned:**
- Function parameter syntax
- Function calls with arguments
- Recursive function calls
- Function return values
- Multiple function definitions

### Exercise 6: Arrays (`06_arrays.ll`)
**Topic:** Arrays and Getelementptr
- Array allocation and initialization
- Array indexing with getelementptr
- Combining arrays with loops

**Skills learned:**
- Array types `[n x type]`
- `getelementptr inbounds` for array indexing
- Dynamic array access with variables
- Array processing patterns

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