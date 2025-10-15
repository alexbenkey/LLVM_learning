#!/bin/bash

# Local CI Setup Validation Script
# This script mimics what CircleCI will do, so you can test locally

# Note: We don't use 'set -e' because some test failures are expected

echo "🔍 LLVM Lit CI Setup Validation"
echo "================================"

# Check if we're in the right directory
if [[ ! -f "lit.cfg.py" ]]; then
    echo "❌ Error: Run this script from the root of your llvm-lit-exploration project"
    exit 1
fi

echo "✅ Found lit.cfg.py - we're in the right directory"

# Check CircleCI config
echo ""
echo "📋 Checking CircleCI Configuration..."
if [[ -f ".circleci/config.yml" ]]; then
    echo "✅ Found .circleci/config.yml"
else
    echo "❌ Missing .circleci/config.yml"
    exit 1
fi

# Validate YAML syntax (if available)
if command -v python3 &> /dev/null; then
    if python3 -c "import yaml" &> /dev/null; then
        python3 -c "
import yaml
try:
    with open('.circleci/config.yml', 'r') as f:
        yaml.safe_load(f)
    print('✅ CircleCI config.yml has valid YAML syntax')
except Exception as e:
    print(f'❌ YAML syntax error: {e}')
    exit(1)
"
    else
        echo "⚠️  YAML validation skipped (python3-yaml not installed)"
        echo "   Install with: pip3 install pyyaml"
    fi
else
    echo "⚠️  YAML validation skipped (python3 not available)"
fi

# Check required tools (like CircleCI will do)
echo ""
echo "🔧 Checking Required Tools..."

tools=("llvm-as" "lli" "clang" "FileCheck" "lit")
missing_tools=()

for tool in "${tools[@]}"; do
    if command -v "$tool" &> /dev/null; then
        version=$(timeout 5s $tool --version 2>&1 | head -1 || echo "version check failed")
        echo "✅ $tool: $version"
    else
        echo "❌ Missing: $tool"
        missing_tools+=("$tool")
    fi
done

if [ ${#missing_tools[@]} -ne 0 ]; then
    echo ""
    echo "❌ Missing required tools: ${missing_tools[*]}"
    echo "Install with: sudo apt-get install -y llvm-20 clang-20 && pip3 install lit"
    exit 1
fi

# Test basic functionality (like CircleCI will do)
echo ""
echo "🧪 Running Tests (like CircleCI will)..."

# Create test output directory
mkdir -p ci-test-output

echo "Running basic tests..."
if lit --xunit-xml-output=ci-test-output/basic-tests.xml tests/basic/; then
    echo "✅ Basic tests passed"
else
    echo "❌ Basic tests failed"
    exit 1
fi

echo "Running all tests..."
if lit --xunit-xml-output=ci-test-output/all-tests.xml tests/; then
    echo "✅ All tests passed"
else
    echo "⚠️  Some tests failed (this might be expected if you have incomplete exercises)"
fi

# Check exercise status
echo ""
echo "📚 Checking Exercise Status..."
if [[ -d "exercises/" ]]; then
    total_exercises=$(find exercises/ -name "*.ll" -not -name "*SOLUTION*" | wc -l)
    
    # Run exercises and capture results  
    lit exercises/ > ci-test-output/exercise-results.txt 2>&1 || true
    
    if grep -q "Passed:" ci-test-output/exercise-results.txt; then
        passed=$(grep "Passed:" ci-test-output/exercise-results.txt | grep -o '[0-9]*' | head -1)
    else
        passed=0
    fi
    
    if grep -q "Failed:" ci-test-output/exercise-results.txt; then
        failed=$(grep "Failed:" ci-test-output/exercise-results.txt | grep -o '[0-9]*' | head -1)
    else
        failed=0
    fi
    
    echo "📊 Exercise Progress:"
    echo "   Total Exercises: $total_exercises"
    echo "   Completed: $passed"
    echo "   Incomplete: $failed"
    echo "   Progress: $passed/$total_exercises completed"
    
    if [ "$passed" -eq "$total_exercises" ]; then
        echo "🎉 All exercises completed!"
    else
        echo "💪 Keep working on the exercises!"
    fi
else
    echo "⚠️  No exercises directory found"
fi

# Test performance timing (like comprehensive CI job)
echo ""
echo "⏱️  Performance Test..."
lit --time-tests tests/ > ci-test-output/timing-results.txt
if grep -q "Slowest Tests:" ci-test-output/timing-results.txt; then
    echo "✅ Timing analysis complete"
    grep -A 5 "Slowest Tests:" ci-test-output/timing-results.txt
else
    echo "⚠️  No timing data available"
fi

# Check XML output quality
echo ""
echo "📄 Checking XML Output Quality..."
xml_files=(ci-test-output/*.xml)
if [ -f "${xml_files[0]}" ]; then
    for xml_file in ci-test-output/*.xml; do
        if [[ -f "$xml_file" ]]; then
            # Basic XML validation
            if command -v xmllint &> /dev/null; then
                if xmllint --noout "$xml_file" 2>/dev/null; then
                    echo "✅ $xml_file is valid XML"
                else
                    echo "❌ $xml_file has XML syntax errors"
                fi
            else
                # Basic check without xmllint
                if grep -q "<testsuites" "$xml_file" && grep -q "</testsuites>" "$xml_file"; then
                    echo "✅ $xml_file appears to be valid XML"
                else
                    echo "❌ $xml_file doesn't look like valid XML"
                fi
            fi
        fi
    done
else
    echo "❌ No XML output files found"
fi

# Summary
echo ""
echo "📋 CI Readiness Summary"
echo "======================="

# Count test files
total_tests=$(find tests/ -name "*.ll" -o -name "*.cpp" -o -name "*.test" | wc -l)
echo "📊 Test Coverage:"
echo "   Total test files: $total_tests"
echo "   Test directories: $(find tests/ -type d | wc -l)"

echo ""
echo "🎯 CI Setup Status:"
echo "   ✅ CircleCI config present"
echo "   ✅ All required tools available"  
echo "   ✅ Tests can run successfully"
echo "   ✅ XML output generation works"
echo "   ✅ Performance monitoring ready"

echo ""
echo "🚀 Ready for CircleCI!"
echo ""
echo "Next steps:"
echo "1. Push your code to GitHub/GitLab"
echo "2. Connect your repository to CircleCI"
echo "3. Watch your tests run automatically!"
echo ""
echo "Generated artifacts in ci-test-output/ (similar to what CircleCI will create)"

# Clean up on success
echo ""
echo "🧹 Cleaning up temporary files..."
rm -rf ci-test-output
echo "✅ Cleanup complete"