#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull manikantareddy9704/simple-python-flask-app

# Run the Docker image as a container
docker run -d -p 8000:8000 manikantareddy9704/simple-python-flask-app
