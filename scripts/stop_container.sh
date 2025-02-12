#!/bin/bash
set -e
container_name_pattern=$1
# Get container ID(s) matching the name pattern
containerid=$(docker ps -q -f "name=$container_name_pattern")
# Stop the running container (if any)
docker rm $containerid
