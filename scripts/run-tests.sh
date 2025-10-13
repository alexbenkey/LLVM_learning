#!/bin/bash
# Convenient script to run tests with different configurations

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

echo "🧪 LLVM Lit Exploration - Test Runner"
echo "======================================"

# Default options
VERBOSE=""
TEST_PATH="tests/"
OUTPUT_FORMAT=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--verbose)
            VERBOSE="-v"
            shift
            ;;
        -j|--json)
            OUTPUT_FORMAT="--output-format=json"
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [options] [test_path]"
            echo "Options:"
            echo "  -v, --verbose     Enable verbose output"
            echo "  -j, --json        Output results in JSON format"
            echo "  -h, --help        Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0                          # Run all tests"
            echo "  $0 -v                       # Run all tests with verbose output"
            echo "  $0 tests/basic/             # Run only basic tests"
            echo "  $0 -v tests/basic/hello.ll  # Run specific test with verbose output"
            exit 0
            ;;
        *)
            TEST_PATH="$1"
            shift
            ;;
    esac
done

echo "Running tests in: $TEST_PATH"
echo "Verbose mode: ${VERBOSE:-disabled}"
echo ""

# Create output directory if it doesn't exist
mkdir -p Output

# Run the tests
if [ -n "$OUTPUT_FORMAT" ]; then
    echo "Running with JSON output..."
    lit $VERBOSE $OUTPUT_FORMAT "$TEST_PATH"
else
    echo "Running tests..."
    lit $VERBOSE "$TEST_PATH"
fi

echo ""
echo "✅ Test run completed!"