#!/bin/bash

echo "Docker Setup Script Started"

# Check OS
if [ "$(uname)" != "Linux" ]; then
    echo "This is not a Linux system. Exiting..."
    exit 1
fi

echo "This is a Linux system"

# Check if Docker is already installed
if command -v docker &>/dev/null; then
    echo "Docker is already installed"
    docker --version
else
    echo "Docker is not installed. Installing Docker..."

    sudo apt-get update
    sudo apt-get install docker.io -y

    sudo usermod -aG docker $USER
    newgrp docker

    echo "Docker installation completed"
    docker --version
fi

# Docker Hub Login
echo
echo "Docker Hub Login"
read -p "Docker Username: " DOCKER_USER
read -s -p "Docker Password: " DOCKER_PASS
echo

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

