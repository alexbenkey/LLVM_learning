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

# Find LLVM tools - try multiple possible locations and use system PATH fallback
def find_tool(name):
    """Find a tool in various possible locations"""
    # Try versioned paths first (for LLVM 20)
    possible_paths = [
        f'/usr/bin/{name}-20',
        f'/usr/lib/llvm-20/bin/{name}',
        f'/usr/bin/{name}',
        name  # Fallback to PATH
    ]
    
    for path in possible_paths:
        try:
            # Check if the tool exists and is executable
            result = subprocess.run([path, '--version'], 
                                  capture_output=True, 
                                  text=True, 
                                  timeout=5)
            if result.returncode == 0:
                lit_config.note(f'Found {name} at: {path}')
                return path
        except (subprocess.TimeoutExpired, subprocess.CalledProcessError, FileNotFoundError):
            continue
    
    # If not found, return the name anyway (let lit handle the error)
    lit_config.warning(f'Could not find {name}, using PATH fallback')
    return name

# Find all required tools
tools = {
    'llvm-as': find_tool('llvm-as'),
    'lli': find_tool('lli'),
    'opt': find_tool('opt'),
    'FileCheck': find_tool('FileCheck'),
    'clang': find_tool('clang'),
    'clang++': find_tool('clang++'),
}

# Add tool substitutions
for name, path in tools.items():
    config.substitutions.append(('%' + name, path))
    lit_config.note(f'Tool substitution: %{name} -> {path}')

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