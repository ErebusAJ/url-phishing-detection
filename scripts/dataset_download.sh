#!/bin/bash

# Create kaggle directory if not exists
mkdir -p ~/.kaggle

# Copy kaggle.json (must be present in current directory)
if [ -f "kaggle.json" ]; then
    cp kaggle.json ~/.kaggle/
    chmod 600 ~/.kaggle/kaggle.json
else
    echo "ERROR: kaggle.json file not found! Place it next to this script."
    exit 1
fi

# Create data directory
mkdir -p data

# Download and unzip dataset from Kaggle
kaggle datasets download -d shashwatwork/web-page-phishing-detection-dataset -p data --unzip

echo "Dataset downloaded and extracted into the 'data/' folder."
