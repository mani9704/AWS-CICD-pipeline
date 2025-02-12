#!/bin/bash
set -e

# Stop the running container (if any)
containerid=$(docker ps -q -f "name=$1")
docker rm $containerid
