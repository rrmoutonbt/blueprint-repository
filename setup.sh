#!/bin/bash
set -e

# Define repository URLs (use these if not already set as environment variables)
BLOCKCHAIN_CORE_REPO=${BLOCKCHAIN_CORE_REPO:-"https://github.com/rrmoutonbt/Future-Exchange.git"}
ISO_COMPLIANCE_REPO=${ISO_COMPLIANCE_REPO:-"https://github.com/rrmoutonbt/ISO-Complian-on-chain-enforcement-7-.git"}
BLOCKCHAIN_NETWORK_REPO=${BLOCKCHAIN_NETWORK_REPO:-"https://github.com/rrmoutonbt/Network-Layer-ISO-Compliant-.git"}

# Clone repositories
echo "Cloning repositories..."
[ ! -d "Future-Exchange" ] && git clone $BLOCKCHAIN_CORE_REPO Future-Exchange
[ ! -d "ISO-Complian-on-chain-enforcement-7-" ] && git clone $ISO_COMPLIANCE_REPO ISO-Complian-on-chain-enforcement-7-
[ ! -d "Network-Layer-ISO-Compliant-" ] && git clone $BLOCKCHAIN_NETWORK_REPO Network-Layer-ISO-Compliant-

# Update repositories if they already exist
echo "Updating repositories..."
cd Future-Exchange && git pull && cd ..
cd ISO-Complian-on-chain-enforcement-7- && git pull && cd ..
cd Network-Layer-ISO-Compliant- && git pull && cd ..

# Create build directory
echo "Setting up build directory..."
mkdir -p build
cd build

# Run CMake with proper paths
echo "Running CMake..."
cmake -DBLOCKCHAIN_CORE_DIR=../blockchain-core \
      -DISO_COMPLIANCE_DIR=../iso-compliance \
      -DBLOCKCHAIN_NETWORK_DIR=../blockchain-network \
