# -*- Python -*-

import os
import platform
import subprocess
import lit.formats
import lit.util

from lit.llvm import llvm_config
from lit.llvm.subst import ToolSubst

# Configuration file for the 'lit' test runner.

# name: The name of this test suite.
config.name = 'LLVM-Lit-Exploration'

# testFormat: The test format to use to interpret tests.
config.test_format = lit.formats.ShTest(not llvm_config.use_lit_shell)

# suffixes: A list of file extensions to treat as test files.
config.suffixes = ['.ll', '.c', '.cpp', '.test', '.txt']

# excludes: A list of directories to exclude from the testsuite.
config.excludes = ['Inputs', 'CMakeLists.txt', 'README.txt', 'LICENSE.txt']

# test_source_root: The root path where tests are located.
config.test_source_root = os.path.dirname(__file__)

# test_exec_root: The root path where tests should be run.
config.test_exec_root = os.path.join(config.test_source_root, 'Output')

# Tweak the PATH to include the tools dir.
llvm_config.with_system_environment(['HOME', 'INCLUDE', 'LIB', 'TMP', 'TEMP'])

llvm_config.use_default_substitutions()

# excludes: A list of directories to exclude from the testsuite. The 'Inputs'
# subdirectories contain auxiliary inputs for various tests in their parent
# directories.
config.excludes = ['Inputs', 'Examples', 'CMakeLists.txt', 'README.txt', 'LICENSE.txt']

# test_source_root: The root path where tests are located.
config.test_source_root = os.path.join(os.path.dirname(__file__), 'tests')

# test_exec_root: The root path where tests should be run.
config.test_exec_root = os.path.join(config.test_source_root, '..', 'Output')

# Setup config for LLVM tools
llvm_config.with_environment('PATH', config.llvm_tools_dir, append_path=True)

# Add common tool substitutions
tool_patterns = [
    'FileCheck', 'count', 'not', 'llvm-config',
    'clang', 'clang++', 'opt', 'llc', 'lli',
    'llvm-as', 'llvm-dis', 'llvm-link', 'llvm-nm',
    'llvm-objdump', 'llvm-readobj', 'llvm-ar',
]

llvm_config.add_tool_substitutions(tool_patterns, config.llvm_tools_dir)

# Setup target triple
config.target_triple = "(unused)"

# Platform-specific configuration
if platform.system() == 'Darwin':
    # This line is not needed on Apple platforms that don't support AppleClang
    pass
elif platform.system() == 'Windows':
    config.available_features.add('system-windows')

# Check if we're running on a specific platform
if platform.machine() in ['x86_64', 'AMD64']:
    config.available_features.add('x86_64')

if platform.machine() in ['aarch64', 'arm64']:
    config.available_features.add('aarch64')

# Add custom substitutions
config.substitutions.append(('%build_dir', config.test_exec_root))
config.substitutions.append(('%src_dir', config.test_source_root))

# Make sure we can run basic commands
config.available_features.add('shell')

# Add debugging feature if DEBUG environment variable is set
if 'DEBUG' in os.environ:
    config.available_features.add('debug')

lit_config.note('Using configuration file: {}'.format(__file__))
lit_config.note('Test source root: {}'.format(config.test_source_root))
lit_config.note('Test exec root: {}'.format(config.test_exec_root))