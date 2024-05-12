#!/bin/bash

# Script to build Docker image for the web application

# Define the Docker image name
IMAGE_NAME="capstone"

# Build the Docker image
sudo docker build -t "$IMAGE_NAME" .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image built successfully: $IMAGE_NAME"
else
  echo "Failed to build Docker image."
  exit 1
fi
