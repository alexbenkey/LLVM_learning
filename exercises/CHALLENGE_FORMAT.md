# LLVM IR Challenge Exercises

## Philosophy: Learn by Doing, Not by Following

You were absolutely right - the original exercises were too easy! Simply removing `; HINT:` prefixes teaches you nothing about **real problem-solving**.

These new challenges are designed like **real-world programming problems**:
- **No exact solutions provided**
- **Research required**
- **Multiple approaches possible**
- **Authentic difficulty progression**

## What Makes These Challenging?

### ❌ **Old Format (Too Easy):**
```llvm
; TODO: Declare the global string constant for "Hello, LLVM!\n"
; HINT: @hello_str = private unnamed_addr constant [14 x i8] c"Hello, LLVM!\0A\00", align 1
```
*Problem: Just copy-paste the hint = no learning*

### ✅ **New Format (Challenging):**
```llvm
; GOAL: Make this program output exactly what the CHECK lines expect
; CONSTRAINTS: You can ONLY modify the function body
; RESEARCH SKILLS NEEDED: LLVM IR arithmetic, printf format strings
; Expected output:
; CHECK: The answer is 42
; CHECK-NEXT: Calculation: 6 * 7 = 42
```
*Solution: Figure out from the expected output that you need to multiply 6 × 7 and format it properly*

## Challenge Categories

### 🔍 **Reverse Engineering** (Challenges 1)
- Given expected output, figure out the implementation
- Teaches: Reading requirements, problem decomposition
- **Real skill**: Understanding specifications and working backwards

### 🔧 **Analysis & Prediction** (Challenge 2) 
- Analyze inefficient code and predict optimizations
- Teaches: Understanding compiler internals
- **Real skill**: Performance analysis and optimization understanding

### 🧩 **Complex Problem Solving** (Challenges 3-4)
- Multi-part problems requiring integration of concepts
- Teaches: System thinking, algorithm implementation
- **Real skill**: Breaking down complex requirements

### 🏗️ **Advanced Implementation** (Challenges 5-6)
- Open-ended problems with multiple valid approaches
- Teaches: Software architecture, trade-off analysis
- **Real skill**: Professional-level programming

## Learning Approach

### 1. **Read the Problem Carefully**
- Understand the GOAL
- Note the CONSTRAINTS  
- Identify RESEARCH SKILLS NEEDED
- Look at expected CHECK patterns

### 2. **Research Phase**
- LLVM Language Reference Manual
- Look at working examples in `tests/` directory
- Search for similar patterns online
- Experiment with small code snippets

### 3. **Iterative Development**
- Start with simplest possible solution
- Run `lit exercise_name.ll` to see what fails
- Analyze error messages
- Refine and improve

### 4. **Learn from Failures**
- Each failure teaches you something
- Error messages guide you toward solutions
- Multiple attempts build understanding

## Example Workflow: Challenge 1

**Step 1: Analyze the problem**
```
Expected output:
; CHECK: The answer is 42
; CHECK-NEXT: Calculation: 6 * 7 = 42
```
*"I need to output these exact strings"*

**Step 2: Research**
- How do I print strings in LLVM IR?
- How do I do arithmetic?
- How do I format output?

**Step 3: Experiment**
```llvm
; Try simple approach first
define i32 @mystery_function() {
entry:
  ; Maybe just return something?
  ret i32 42
}
```

**Step 4: Test and iterate**
```bash
lit exercises/01_reverse_engineer.ll
# Fails because no output is printed
# Need to add printf calls...
```

**Step 5: Refine**
```llvm
declare i32 @printf(ptr, ...)
@msg1 = private constant [17 x i8] c"The answer is 42\00"
define i32 @mystery_function() {
entry:
  %str1 = getelementptr [17 x i8], ptr @msg1, i32 0, i32 0
  call i32 @printf(ptr %str1)
  ; Continue working...
```

## Difficulty Progression

### ⭐⭐☆☆☆ **Challenges 1**: Foundation
- Basic syntax and concepts
- Single-step problems
- Clear constraints

### ⭐⭐⭐☆☆ **Challenge 2**: Analysis  
- Understanding existing code
- Predicting transformations
- Research-heavy

### ⭐⭐⭐⭐☆ **Challenges 3-4**: Integration
- Multiple concepts combined
- Real algorithm implementation
- Complex control flow

### ⭐⭐⭐⭐⭐ **Challenges 5-6**: Mastery
- Open-ended problems
- Multiple valid solutions
- Professional-level complexity

## Resources for Research

### Official Documentation
- [LLVM Language Reference](https://llvm.org/docs/LangRef.html)
- [LLVM Programmer's Manual](https://llvm.org/docs/ProgrammersManual.html)

### Your Project Examples
- Look at `tests/` directory for working patterns
- Compare `tests/cpp/` for C++ compilation examples
- Study `tests/advanced/` for optimization examples

### External Resources
- LLVM Tutorial series
- Stack Overflow LLVM IR questions
- Academic papers on compiler optimization

## Success Metrics

**You're succeeding when:**
- ✅ You can read LLVM IR and understand what it does
- ✅ You can research unfamiliar concepts independently
- ✅ You can debug by analyzing error messages
- ✅ You can implement algorithms from scratch in LLVM IR
- ✅ You understand the "why" behind language features

**Not just:**
- ❌ Copying provided solutions
- ❌ Memorizing syntax without understanding
- ❌ Getting tests to pass without learning

## The Real Goal

These challenges prepare you for **real compiler work** where:
- No one gives you exact solutions
- You must research and experiment
- Problems are complex and multi-faceted
- Understanding trumps memorization

Welcome to authentic LLVM IR learning! 🚀