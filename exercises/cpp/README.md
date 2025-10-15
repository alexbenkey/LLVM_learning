# C++ Challenge Exercises

## Philosophy: Understanding High-Level to Low-Level Translation

These C++ exercises teach you how modern C++ features are implemented in LLVM IR. This is crucial for understanding:
- **Compiler internals**: How high-level constructs become low-level code
- **Performance implications**: Why certain C++ features have overhead
- **Optimization behavior**: How compilers optimize away abstractions

## Why C++ + LLVM IR?

**Real compiler development** requires understanding both:
1. **High-level semantics**: What the C++ code means
2. **Low-level implementation**: How it's actually executed

These exercises bridge that gap by making you **predict** the LLVM IR that will be generated.

## Challenge Structure

Each exercise follows this pattern:
1. **Complex C++ code** using advanced features
2. **Multiple compilation modes** (-O0 vs -O2)
3. **Output prediction** (what gets printed)
4. **IR analysis** (what LLVM IR gets generated)
5. **Optimization comparison** (how -O2 changes things)

## Exercise Progression

### Challenge C++0: Basic Functions ⭐⭐☆☆☆
**Topic**: Gentle Introduction to C++ → LLVM IR Analysis
- Simple function calls and arithmetic
- Basic control flow (if-else)
- Introduction to optimization effects

**What you'll learn:**
- How to predict program output from C++ code
- How basic C++ constructs appear in LLVM IR
- The difference between -O0 and -O2 compilation
- The process of making and testing predictions

**Perfect for:**
- First-time C++ → LLVM IR analysis
- Understanding the exercise format
- Building confidence before tackling harder challenges

### Challenge C++1: Template Detective ⭐⭐⭐☆☆
**Topic**: Template Instantiation and Metaprogramming
- Recursive template specialization
- Compile-time vs runtime computation
- Template name mangling in LLVM IR

**What you'll learn:**
- How template recursion is handled by the compiler
- When computations happen at compile-time vs runtime
- How template instantiations appear in LLVM IR
- Optimization effects on template-heavy code

**Research areas:**
- Template instantiation mechanics
- Constant folding in templates
- LLVM IR function name mangling

### Challenge C++2: Virtual Function Dispatch ⭐⭐⭐⭐☆
**Topic**: Polymorphism and Virtual Function Tables
- Virtual vs non-virtual function calls
- Vtable structure and implementation
- Dynamic dispatch overhead

**What you'll learn:**
- How vtables are represented in LLVM IR
- Performance difference between virtual and non-virtual calls
- How polymorphism is implemented at the machine level
- The cost of dynamic dispatch

**Research areas:**
- Virtual function table implementation
- Dynamic dispatch mechanisms
- LLVM IR vtable representation

### Challenge C++3: Exception Handling and RAII ⭐⭐⭐⭐⭐
**Topic**: Exception Safety and Stack Unwinding
- Exception handling implementation
- Stack unwinding mechanisms
- RAII (Resource Acquisition Is Initialization)

**What you'll learn:**
- How C++ exceptions are implemented in LLVM IR
- Stack unwinding and cleanup mechanisms
- Exception handling overhead
- RAII automatic cleanup behavior

**Research areas:**
- LLVM IR exception handling constructs
- `invoke`, `landingpad`, `resume` instructions
- Stack unwinding implementation

### Challenge C++4: Lambda Closures ⭐⭐⭐⭐☆
**Topic**: Lambda Expressions and Closure Objects
- Different capture modes (by value, by reference, mutable)
- Closure object generation
- Lambda optimization

**What you'll learn:**
- How lambdas are implemented as closure objects
- Different capture semantics in LLVM IR
- When lambdas can be optimized away
- Function object generation

**Research areas:**
- Closure object layout
- Lambda capture implementation
- Function object optimization

### Challenge C++5: Move Semantics and Perfect Forwarding ⭐⭐⭐⭐⭐
**Topic**: Modern C++ Performance Features
- Move constructors vs copy constructors
- Perfect forwarding templates
- Return Value Optimization (RVO)

**What you'll learn:**
- How move semantics reduce copying overhead
- Perfect forwarding template instantiation
- When RVO eliminates objects entirely
- The difference between lvalue and rvalue handling

**Research areas:**
- Move semantics implementation
- Universal reference template deduction
- RVO and NRVO optimization

## Learning Approach

### 1. **Analyze the C++ Code**
- Understand what the code does at a high level
- Identify which C++ features are being used
- Predict the runtime behavior

### 2. **Research the Feature**
- Look up how the C++ feature is typically implemented
- Find documentation about LLVM IR representations
- Study similar examples in your `tests/cpp/` directory

### 3. **Make Predictions**
- What will the program output?
- What LLVM IR constructs will be generated?
- How will optimization change the implementation?

### 4. **Test and Learn**
- Run the exercise: `lit exercises/cpp/01_template_detective.cpp`
- Compare your predictions with actual results
- Analyze where you were right/wrong

### 5. **Deep Dive Analysis**
- Study the generated LLVM IR files
- Compare -O0 vs -O2 optimization differences
- Understand why certain optimizations occurred

## Testing Commands

```bash
# Test a specific C++ exercise
lit exercises/cpp/01_template_detective.cpp

# Run with verbose output to see all steps
lit -v exercises/cpp/01_template_detective.cpp

# Test all C++ exercises
lit exercises/cpp/

# Generate and inspect LLVM IR manually
clang++ -S -emit-llvm -O0 exercises/cpp/01_template_detective.cpp -o debug-O0.ll
clang++ -S -emit-llvm -O2 exercises/cpp/01_template_detective.cpp -o debug-O2.ll
```

## Research Resources

### C++ Language References
- [C++ Reference - Templates](https://en.cppreference.com/w/cpp/language/templates)
- [C++ Reference - Virtual Functions](https://en.cppreference.com/w/cpp/language/virtual)
- [C++ Reference - Lambda Expressions](https://en.cppreference.com/w/cpp/language/lambda)
- [C++ Reference - Move Semantics](https://en.cppreference.com/w/cpp/utility/move)

### LLVM IR Documentation
- [LLVM Language Reference](https://llvm.org/docs/LangRef.html)
- [Exception Handling in LLVM](https://llvm.org/docs/ExceptionHandling.html)
- [LLVM Optimization Guide](https://llvm.org/docs/Passes.html)

### Compiler Implementation Resources
- Itanium C++ ABI (name mangling, vtables)
- "Effective Modern C++" by Scott Meyers
- LLVM IR generation from Clang

## Success Metrics

**You're succeeding when you can:**
- ✅ Predict program output based on C++ semantics
- ✅ Understand how high-level features become low-level code
- ✅ Explain the performance implications of C++ features
- ✅ Recognize optimization opportunities in C++ code
- ✅ Read and understand generated LLVM IR

**Advanced success:**
- ✅ Predict which optimizations will be applied
- ✅ Understand the trade-offs in C++ design decisions
- ✅ Recognize when abstractions have zero cost
- ✅ Debug performance issues by understanding the generated code

## Integration with Main Exercises

These C++ exercises complement the pure LLVM IR exercises:
- **LLVM IR exercises**: Learn the instruction set and low-level concepts
- **C++ exercises**: Understand how real-world code becomes LLVM IR

Together, they give you a complete picture of modern compiler toolchains!

## Difficulty Warning

These exercises are **intentionally challenging**. They require:
- Strong C++ knowledge
- Research skills
- Understanding of computer systems
- Patience for detailed analysis

**Don't worry if they're hard** - that's the point! Real compiler work requires this level of understanding.

Start with Challenge C++1 and work your way up. Each one builds on concepts from the previous exercises. 🚀