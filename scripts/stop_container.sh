#!/bin/bash

# Container name or pattern to match (e.g., "myapp" or "nginx")
CONTAINER_NAME_PATTERN=$1

# Get container ID(s) matching the name pattern
CONTAINER_IDS=$(docker ps -q -f "name=$CONTAINER_NAME_PATTERN")

# Check if any containers are found
if [ -z "$CONTAINER_IDS" ]; then
  echo "No running containers found with the name pattern: $CONTAINER_NAME_PATTERN"
else
  echo "Found running containers with the name pattern: $CONTAINER_NAME_PATTERN"
  echo "Container IDs:"
  echo "$CONTAINER_IDS"

  # Loop through each container ID and remove the container
  for CONTAINER_ID in $CONTAINER_IDS; do
    echo "Stopping and removing container with ID: $CONTAINER_ID"
    
    # Stop the container
    docker stop $CONTAINER_ID
    
    # Remove the container
    docker rm $CONTAINER_ID
    
    echo "Container with ID $CONTAINER_ID has been removed."
  done
fi
