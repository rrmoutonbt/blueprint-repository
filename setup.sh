#!/bin/bash
set -e

# Clone repositories
git clone $BLOCKCHAIN_CORE_REPO blockchain-core
git clone $ISO_COMPLIANCE_REPO iso-compliance
git clone $BLOCKCHAIN_NETWORK_REPO blockchain-network

# Create build directory
mkdir -p build
cd build

# Run CMake
cmake ..
make -j$(nproc)
