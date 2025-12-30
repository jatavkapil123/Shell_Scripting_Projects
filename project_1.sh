### Install Software according to the system

#!/bin/bash

echo "Script to install git"
echo "Installation Started..."

if [ "$(uname)" == "Linux" ]; 
then
    echo "This is Linux box, installing git..."
    # Use yum for RHEL/CentOS or apt for Ubuntu/Debian
    if command -v yum; 
    then
        sudo yum install git -y
    elif command -v apt; 
    then
        sudo apt update
        udo apt install git -y
    else
        echo "No supported package manager found"
    fi

elif [ "$(uname)" == "Darwin" ]; 
then
    echo "This is MacOS, installing git..."
    brew install git

else
    echo "Not installing: Unsupported OS"
fi
