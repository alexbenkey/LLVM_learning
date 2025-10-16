# -*- coding: utf-8 -*-
# Configuration file for the 'lit' test runner.

import os
import platform
import subprocess
import lit.formats
import lit.util

# Configuration file for the 'lit' test runner.
config.name = 'LLVM-Lit-Exploration'
config.test_format = lit.formats.ShTest()
config.suffixes = ['.ll', '.c', '.cpp', '.test', '.txt']
config.test_source_root = os.path.dirname(__file__)
config.test_exec_root = os.path.join(config.test_source_root, 'Output')
config.excludes = ['Inputs', 'CMakeLists.txt', 'README.txt', 'LICENSE.txt']

# Setup target triple
config.target_triple = "(unused)"

# Simple tool discovery and substitution setup
# Use lit.util.which for clean path resolution
tools = [
    ('llvm-as', ['llvm-as-20', 'llvm-as']),
    ('lli', ['lli-20', 'lli']),
    ('opt', ['opt-20', 'opt']),
    ('FileCheck', ['FileCheck-20', 'FileCheck']),
    ('clang', ['clang-20', 'clang']),
    ('clang++', ['clang++-20', 'clang++']),
]

# Add tool substitutions
for tool_name, candidates in tools:
    tool_path = None
    
    # Try each candidate
    for candidate in candidates:
        found_path = lit.util.which(candidate)
        if found_path:
            tool_path = found_path
            lit_config.note(f'Found {tool_name}: {found_path}')
            break
    
    # Fallback to the primary name if nothing found
    if not tool_path:
        tool_path = candidates[-1]  # Use the unversioned name
        lit_config.warning(f'Using fallback for {tool_name}: {tool_path}')
    
    # Add the substitution
    config.substitutions.append((f'%{tool_name}', tool_path))

# Add other necessary substitutions  
# %t should create unique temporary files for each test
# We'll let lit handle this automatically by not defining %t
# lit will create unique temp files when %t is used
config.substitutions.append(('%T', config.test_exec_root))

# Create output directory
os.makedirs(config.test_exec_root, exist_ok=True)

# Add platform features
if platform.system() == 'Linux':
    config.available_features.add('system-linux')
if platform.machine() in ['x86_64', 'AMD64']:
    config.available_features.add('x86_64')

lit_config.note('test_source_root: {}'.format(config.test_source_root))
lit_config.note('test_exec_root: {}'.format(config.test_exec_root))