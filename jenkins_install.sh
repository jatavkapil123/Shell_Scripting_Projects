#! /bin/bash

echo "Jenkins Installation started..."
if [ "$(uname)" == "Linux" ]
then
    echo "this is linux system"

    echo "Installation java jdk"

    sudo apt update
    sudo apt install -y fontconfig openjdk-21-jre 
    java -version

    echo "Install jenkins"

    # Create keyrings directory if not exists
    sudo mkdur -p /etc/apt/keyring

    # Add Jenkins GPG key
    sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

    # Add Jenkins repository
    echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

    # Install Jenkins
    sudo apt update
    sudo apt install -y jenkins

    # Start & enable Jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins

    echo "Jenkins installation completed successfully"
    echo "Access Jenkins at: http://localhost:8080"
    echo

    # Show Jenkins initial admin password
    echo "Jenkins Initial Admin Password:"
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword

else
    echo "This is not a Linux system. Jenkins not installed."
fi