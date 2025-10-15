# C++ Exercise Quick Start

## Perfect Entry Point: Challenge C++0 🚀

If you're new to analyzing how C++ translates to LLVM IR, **start here**!

### Why C++0 is Perfect for Beginners

**Challenge C++0: Basic Functions** is specifically designed as a gentle introduction:
- ✅ **Simple C++ code** - just functions, arithmetic, and basic if-else
- ✅ **Clear predictions** - straightforward math that's easy to verify  
- ✅ **Learning the process** - understand how to make and test predictions
- ✅ **No advanced features** - no templates, virtual functions, or complex C++

### What You'll Learn in 15 Minutes

```cpp
// Simple function - what LLVM IR instruction does addition become?
int add_numbers(int a, int b) {
    return a + b;
}

// Basic optimization - will this be computed at compile time?  
int calculate_expression(int x) {
    int result = x * 2 + 10;
    return result;
}
```

**By completing C++0, you'll understand:**
- How to predict program output from C++ code
- How function calls translate to LLVM IR
- The difference between -O0 and -O2 optimization
- The exercise format and prediction process

### Quick Test

```bash
# Try it right now!
lit exercises/cpp/00_basic_functions.cpp

# It will fail (that's expected!) - then you can start filling in predictions
```

### After C++0, You're Ready For

**Choose your path based on interest:**
- **C++1 (Templates)**: If you want to understand metaprogramming
- **C++2 (Virtual Functions)**: If you're interested in polymorphism
- **C++3 (Exceptions)**: If you want to see advanced stack unwinding
- **C++4 (Lambdas)**: If modern C++ features intrigue you  
- **C++5 (Move Semantics)**: If performance optimization excites you

### Success Tips for C++0

1. **Start with OUTPUT predictions** - they're just basic math
2. **Then tackle UNOPT predictions** - research basic LLVM IR instructions
3. **Finally OPT predictions** - think about what a compiler might optimize
4. **Use the hints in comments** - they guide you to the right concepts
5. **Don't overthink it** - this is intentionally simple!

### Learning Mindset

**Remember:** The goal isn't to get everything right immediately. It's to:
- Learn the research process
- Understand how to make educated guesses
- Build confidence for harder challenges
- Develop intuition about compilers

**C++0 is your training ground** - once you master the prediction process here, you'll be ready for the advanced challenges! 🎯