#!/bin/bash
set -e

# Define repository URLs (use these if not already set as environment variables)
BLOCKCHAIN_CORE_REPO=${BLOCKCHAIN_CORE_REPO:-"https://github.com/rrmoutonbt/Future-Exchange-Blockchain
.git"}

# Clone repositories
echo "Cloning repositories..."
[ ! -d "Future-Exchange" ] && git clone $BLOCKCHAIN_CORE_REPO Future-Exchange-Blockchain

# Update repositories if they already exist
echo "Updating repositories..."
cd Future-Exchange-Blockchain && git pull && cd ..

# Create build directory
echo "Setting up build directory..."
mkdir -p build
cd build

# Run CMake with proper paths
echo "Running CMake..."
cmake -DBLOCKCHAIN_CORE_DIR=../Future-Exchange-Blockchain \
      
