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

# Find LLVM tools
llvm_tools_dir = '/usr/lib/llvm-20/bin'
tools = {
    'llvm-as': os.path.join(llvm_tools_dir, 'llvm-as'),
    'lli': os.path.join(llvm_tools_dir, 'lli'),
    'opt': os.path.join(llvm_tools_dir, 'opt'),
    'FileCheck': 'FileCheck',  # Should be in system PATH
    'clang': 'clang',
    'clang++': 'clang++',
}

# Add tool substitutions
for name, path in tools.items():
    config.substitutions.append(('%' + name, path))

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