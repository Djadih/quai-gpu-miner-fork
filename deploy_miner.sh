#!/bin/bash

set -e
set -x
# Become root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Install dependencies
if ! command -v cmake &> /dev/null; then
  echo "installing dependencies"
  apt update && apt install -y build-essential cmake mesa-common-dev git wget
else
  echo "dependencies are already installed."
fi

echo "All dependencies installed successfully!"

# Clone quai-gpu-miner
git clone https://github.com/djadih/quai-gpu-miner.git
cd quai-gpu-miner
git fetch --all
git checkout opencl-goldenage
git submodule update --init --recursive
mkdir build && cd build

# Configure cmake
cmake .. -DETHASHCUDA=OFF -DETHASHCL=ON

# Build binary
cmake --build .

# Copy binary to output folder
mkdir -p ../../output && cp ethcoreminer/ethcoreminer ../../output/quai-gpu-miner

# Finish
echo "All tasks completed successfully!"
