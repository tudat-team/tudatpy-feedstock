#!/bin/bash

# Directory within the Conda environment for external repository
TARGET_DIR="$CONDA_PREFIX/share/external-repo"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Clone the repository
git clone https://github.com/NASA-PDS/PyTrk234.git .

# Install the cloned repository into the environment
pip install .