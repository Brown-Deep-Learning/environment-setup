#!/usr/bin/env bash

# Adjust module name/version as needed based on OSCAR's documentation
module load miniconda3/23.11.0s

# Add Miniconda to PATH and source conda.sh in ~/.bashrc if not already added
if ! grep -q "/oscar/runtime/software/external/miniconda3/23.11.0/bin" ~/.bashrc; then
    echo "export PATH=/oscar/runtime/software/external/miniconda3/23.11.0/bin:\$PATH" >> ~/.bashrc
    echo "source /oscar/runtime/software/external/miniconda3/23.11.0/etc/profile.d/conda.sh" >> ~/.bashrc
    echo "Added Miniconda paths to ~/.bashrc. Please run 'source ~/.bashrc' or restart your shell to apply changes."
else
    echo "Miniconda paths are already configured in ~/.bashrc."
fi

# Source the conda.sh script (needed for the current session)
source /oscar/runtime/software/external/miniconda3/23.11.0/etc/profile.d/conda.sh

# Name of the environment
ENV_NAME="csci1470"

# Force remove the environment directory if it exists
if [ -d "$HOME/.conda/envs/$ENV_NAME" ]; then
    echo "Removing existing environment directory..."
    rm -rf "$HOME/.conda/envs/$ENV_NAME"
fi

# Also remove any existing Jupyter kernel
if [ -d "$HOME/.local/share/jupyter/kernels/$ENV_NAME" ]; then
    echo "Removing existing Jupyter kernel..."
    rm -rf "$HOME/.local/share/jupyter/kernels/$ENV_NAME"
fi

# Create the new environment from the YML file
conda env create -n "$ENV_NAME" -f env_setup/csci1470.yml

# Activate the environment
conda activate "$ENV_NAME"

# Install a Jupyter kernel for easy use in notebooks
python -m ipykernel install --user --name "$ENV_NAME" --display-name "DL-F25 (3.11)"

# Verify environment creation
echo "Environment '$ENV_NAME' created and kernel installed."
echo "Run 'conda activate $ENV_NAME' to start using this environment."
echo "You can now clone the course repostitory/assignment and run your assignment!"
