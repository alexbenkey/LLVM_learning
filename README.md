# LLVM Lit Testing Exploration

This project is designed to explore the LLVM testing suite and the capabilities of the `lit` (LLVM Integrated Tester) framework.

## Overview

The `lit` testing tool is a powerful framework used throughout the LLVM project for running tests. It provides a flexible way to define and execute tests with various output formats and test discovery mechanisms.

## Project Structure

```
llvm-lit-exploration/
├── README.md           # This file
├── tests/              # Test files and lit configuration
├── examples/           # Example LLVM IR and other test inputs
├── docs/               # Documentation and notes
├── scripts/            # Setup and utility scripts
└── lit.cfg.py          # Main lit configuration file
```

## Goals

1. **Understanding lit basics**: Learn how to configure and use lit for test execution
2. **Test patterns exploration**: Explore different types of tests commonly used in LLVM
3. **Custom test formats**: Experiment with creating custom test formats and substitutions
4. **Integration testing**: Learn how lit integrates with LLVM tools and infrastructure

## Getting Started

### Prerequisites

- LLVM installation with development tools
- Python 3.x
- lit testing framework (usually comes with LLVM)

### Setup

1. Install LLVM and ensure tools like `clang`, `opt`, `llc` are available
2. Verify `lit` is installed: `lit --version`
3. Run the setup script: `./scripts/setup.sh`

### Running Tests

```bash
# Run all tests
lit tests/

# Run tests with verbose output
lit -v tests/

# Run specific test
lit tests/basic/hello.ll
```

## Test Categories

### Basic Tests
- Simple LLVM IR compilation and execution
- Tool invocation patterns
- Basic FileCheck usage

### Advanced Tests
- Custom substitutions and variables
- Test suite configurations
- Integration with external tools

### Experimental Tests
- Custom test formats
- Advanced lit features
- Performance testing patterns

## Resources

- [LLVM Testing Guide](https://llvm.org/docs/TestingGuide.html)
- [lit - LLVM Integrated Tester](https://llvm.org/docs/CommandGuide/lit.html)
- [FileCheck Documentation](https://llvm.org/docs/CommandGuide/FileCheck.html)

## Contributing

This is a learning project. Feel free to add new test cases, documentation, or improvements to the configuration.

## License

This project is for educational purposes. Individual test cases may reference LLVM documentation and examples.