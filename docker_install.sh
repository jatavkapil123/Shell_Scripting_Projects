#!/bin/bash

echo "Docker Installation started"

if [ "$(uname)" == "Linux" ]; then
    echo "This is Linux"

    sudo apt-get update
    sudo apt-get install docker.io -y

    sudo usermod -aG docker $USER
    newgrp docker

    echo "Docker installed successfully"

    echo "Login to Docker Hub"
    read -p "Docker Username: " DOCKER_USER
    read -s -p "Docker Password: " DOCKER_PASS
    echo

    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

else
    echo "This is not Linux"
fi
