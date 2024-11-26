#!/bin/bash

# Exit on errors
set -e

echo "===== Setting Up Stable-Fast-3D Environment ====="

# 1. Create and activate virtual environment
echo "Creating virtual environment..."
if command -v python3 &>/dev/null; then
    PYTHON_CMD=python3
elif command -v python &>/dev/null; then
    PYTHON_CMD=python
else
    echo "Python is not installed. Please install Python 3.7+ and rerun this script."
    exit 1
fi

$PYTHON_CMD -m pip install --upgrade pip setuptools virtualenv
virtualenv venv
source venv/bin/activate

echo "Virtual environment created and activated."

# 2. Install setuptools, wheel, and PyTorch
echo "Installing setuptools, wheel, and PyTorch..."
pip install -U setuptools==69.5.1 wheel
pip install torch --extra-index-url https://download.pytorch.org/whl/cpu

# 3. Install dependencies
echo "Installing dependencies from requirements.txt (excluding gpytoolbox)..."
sed '/gpytoolbox/d' requirements.txt > temp_requirements.txt
pip install -r temp_requirements.txt
rm temp_requirements.txt

# 4. Install gpytoolbox
echo "Installing gpytoolbox with custom build flags..."
pip install --no-build-isolation --no-use-pep517 gpytoolbox

# 5. Hugging Face CLI Login
echo "Setting up Hugging Face access..."
echo "Our model is gated at Hugging Face:"
echo "1. Log in to Hugging Face and request access here: https://huggingface.co/stabilityai/stable-fast-3d"
echo "2. Create an access token with read permissions here: https://huggingface.co/settings/tokens"
echo
read -p "Enter your Hugging Face access token: " HUGGINGFACE_TOKEN
echo "$HUGGINGFACE_TOKEN" | huggingface-cli login --token

echo "Hugging Face access configured."

# 6. Final message
echo "===== Setup Complete ====="
echo "To activate the environment in the future, run:"
echo "source venv/bin/activate"
echo "==============================================="
