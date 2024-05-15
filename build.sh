#!/bin/bash

# Script to build Docker image for the web application

# Define the Docker image name
IMAGE_NAME="capstone"
DOCKER_REPO="veera030"  # Your Docker Hub username


BRANCH_NAME=${GIT_BRANCH##*/}

# Build the Docker image
docker build -t "$IMAGE_NAME" .

docker login -u veera030 -p sindhuamu@98

if [ "$BRANCH_NAME" == "devs" ]; then
  docker tag "$IMAGE_NAME":capstone veera030/dev:capstone
  docker push veera030/dev:capstone
  if [ $? -ne 0 ]; then
    echo "Failed to push Docker image to dev repository."
    exit 1
  fi
  echo "Docker image pushed to dev repository: $dev:latest"
elif [ "$BRANCH_NAME" == "master" ]; then
  docker tag "$IMAGE_NAME":capstone veera030/prod:capstone
  docker push veera030/prod:capstone
  if [ $? -ne 0 ]; then
    echo "Failed to push Docker image to prod repository."
    exit 1
  fi
  echo "Docker image pushed to prod repository: $PROD_REPO:latest"
else
  echo "Branch $BRANCH_NAME does not trigger Docker image push."
  exit 0
fi
