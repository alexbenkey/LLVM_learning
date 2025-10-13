# Getting Started with LLVM IR Exercises

Welcome to your LLVM IR learning journey! 🎉

## Quick Start

You now have **6 progressive exercises** that will teach you LLVM IR from the ground up. Each exercise is designed to fail initially and pass when you complete it correctly.

### Your First Exercise

Let's start with Exercise 1:

```bash
# See the current status (should FAIL)
lit exercises/01_hello_world.ll

# Open the exercise file to see what you need to do
cat exercises/01_hello_world.ll
```

### Exercise Status Check

```bash
# See which exercises are incomplete
lit exercises/ | grep FAIL

# Current status (all should fail except the SOLUTION file):
# FAIL: exercises/01_hello_world.ll      ← Start here!
# FAIL: exercises/02_arithmetic.ll 
# FAIL: exercises/03_conditionals.ll
# FAIL: exercises/04_loops.ll
# FAIL: exercises/05_functions.ll
# FAIL: exercises/06_arrays.ll
# PASS: exercises/01_hello_world_SOLUTION.ll  ← This shows it works!
```

## How to Complete an Exercise

1. **Read the file**: Open `exercises/01_hello_world.ll`
2. **Find TODOs**: Look for lines starting with `; TODO:`
3. **Use the hints**: Each TODO has a `; HINT:` with the exact code you need
4. **Fill in the code**: Replace TODO comments with actual LLVM IR
5. **Test it**: Run `lit exercises/01_hello_world.ll`
6. **Success!**: The test passes when you get it right

### Example: Completing Exercise 1

The file has sections like this:
```llvm
; TODO: Declare the global string constant for "Hello, LLVM!\n"
; HINT: @hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1
```

You would replace the TODO comment with the hint code:
```llvm
@hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1
```

## Learning Path

**Recommended order** (each builds on the previous):
1. `01_hello_world.ll` - Basic structure, globals, function calls
2. `02_arithmetic.ll` - Variables, load/store, basic math  
3. `03_conditionals.ll` - Comparisons, branching, basic blocks
4. `04_loops.ll` - Loops, phi nodes, control flow
5. `05_functions.ll` - Function definitions, calls, recursion
6. `06_arrays.ll` - Arrays, getelementptr, complex indexing

## What You'll Learn

By the end of these exercises, you'll understand:
- ✅ LLVM IR basic syntax and structure
- ✅ Variable allocation and memory operations
- ✅ Arithmetic and comparison operations
- ✅ Control flow (if/else, loops)
- ✅ Function definitions and calls
- ✅ Arrays and pointer arithmetic
- ✅ SSA form and phi nodes

## Getting Help

- **Stuck?** Look at `exercises/README.md` for detailed explanations
- **Need syntax help?** The README has an LLVM IR reference section
- **Want to peek?** Check `exercises/01_hello_world_SOLUTION.ll` for the first solution

## Tips for Success

1. **Start simple**: Begin with exercise 1
2. **Read everything**: The comments explain what each part does
3. **Copy hints exactly**: LLVM IR syntax is strict
4. **Test frequently**: Run `lit` after each change
5. **Understand before moving on**: Make sure you grasp each concept

## Ready to Begin?

```bash
# Start with exercise 1
lit exercises/01_hello_world.ll    # Should FAIL initially
# Now open exercises/01_hello_world.ll in your editor and fill in the TODOs!
```

Good luck! You're about to learn one of the most important intermediate representations in modern computing. 🚀