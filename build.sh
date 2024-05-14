#!/bin/bash

# Script to build Docker image for the web application

# Define the Docker image name
IMAGE_NAME="capstone"
DOCKER_REPO="veera030"  # Your Docker Hub username
DOCKER_DEV_TAG="dev"
DOCKER_PROD_TAG="prod"

# Build the Docker image
docker build -t "$DOCKER_REPO/$IMAGE_NAME:$DOCKER_DEV_TAG" .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image built successfully: $DOCKER_REPO/$IMAGE_NAME:$DOCKER_DEV_TAG"
else
  echo "Failed to build Docker image."
  exit 1
fi

# Push the image to Docker Hub dev repository
docker push "$DOCKER_REPO/$IMAGE_NAME:$DOCKER_DEV_TAG"

