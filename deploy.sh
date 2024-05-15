#!/bin/bash

# Script to deploy the web application using Docker Compose

# Define the Docker Compose file
DOCKER_COMPOSE_FILE="docker-compose.yml"

BRANCH_NAME=${GIT_BRANCH##*/}

# Deploy the application using Docker Compose
docker-compose -f "$DOCKER_COMPOSE_FILE" up -d

# Check if the deployment was successful
if [ $? -eq 0 ]; then
  echo "Application deployed successfully."
else
  echo "Failed to deploy application."
  exit 1
fi
