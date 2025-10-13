#!/bin/bash
# Setup script for LLVM Lit Exploration project

set -e

echo "🔧 Setting up LLVM Lit Exploration environment..."

# Check if required tools are available
check_tool() {
    if ! command -v "$1" &> /dev/null; then
        echo "❌ $1 is not available. Please install LLVM/Clang."
        return 1
    else
        echo "✅ $1 found: $(which "$1")"
        return 0
    fi
}

# Check for essential LLVM tools
echo "Checking for LLVM tools..."
TOOLS_MISSING=0

for tool in clang clang++ opt llc lli llvm-as llvm-dis FileCheck lit; do
    if ! check_tool "$tool"; then
        TOOLS_MISSING=1
    fi
done

if [ $TOOLS_MISSING -eq 1 ]; then
    echo ""
    echo "Some required tools are missing. Please install LLVM/Clang."
    echo "On Ubuntu/Debian: sudo apt install llvm clang llvm-dev"
    echo "On macOS: brew install llvm"
    echo "On Fedora: sudo dnf install llvm clang llvm-devel"
    exit 1
fi

# Create output directory
echo ""
echo "📁 Creating output directory..."
mkdir -p Output

# Display versions
echo ""
echo "📋 Tool versions:"
clang --version | head -1
llvm-config --version
lit --version 2>/dev/null || echo "lit version: $(python3 -c 'import lit; print(lit.__version__)' 2>/dev/null || echo 'unknown')"

# Test lit configuration
echo ""
echo "🧪 Testing lit configuration..."
if lit --show-tests tests/ &> /dev/null; then
    echo "✅ Lit configuration is valid"
    echo "Available tests:"
    lit --show-tests tests/ 2>/dev/null | grep -E "\.ll$|\.test$|\.c$" | head -5
else
    echo "⚠️  Lit configuration needs adjustment"
    echo "You may need to install lit: pip install lit"
fi

echo ""
echo "🎉 Setup complete! You can now run tests with:"
echo "  lit tests/                    # Run all tests"
echo "  lit -v tests/                 # Run with verbose output"
echo "  lit tests/basic/hello.ll      # Run specific test"

echo ""
echo "📚 Next steps:"
echo "  1. Review the README.md for detailed information"
echo "  2. Explore example tests in tests/"
echo "  3. Try creating your own test files"
echo "  4. Experiment with different lit configurations"