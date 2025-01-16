#!/usr/bin/env bash

# Adjust module name/version as needed based on OSCAR's documentation
module load miniconda3/23.11.0s

# Source the conda.sh script so 'conda' commands are recognized
source /oscar/runtime/software/external/miniconda3/23.11.0/etc/profile.d/conda.sh

# Name of the environment
ENV_NAME="csci1470"

# Remove existing environment if it exists
conda env remove -n "$ENV_NAME" --yes

# Create the new environment from the YML file.
# Note: Make sure you are in the correct directory so that
# 'env_setup/Other/csci1470.yml' can be found.
conda env create -n "$ENV_NAME" -f env_setup/csci1470.yml

# Activate the environment
conda activate "$ENV_NAME"

# Install a Jupyter kernel for easy use in notebooks
python -m ipykernel install --user --name "$ENV_NAME" --display-name "DL-S25 (3.10)"

# (Optional) Verify environment creation
echo "Environment '$ENV_NAME' created and kernel installed."
echo "Run 'conda activate $ENV_NAME' to start using this environment."