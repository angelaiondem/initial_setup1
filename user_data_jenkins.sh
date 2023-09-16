#!/bin/bash

# Update the package list
sudo apt update -y
sudo apt upgrade -y

# Install Java (OpenJDK 8)
sudo apt install openjdk-11-jdk-headless -y
 
# Install wget
sudo apt install wget -y

# Add Jenkins repository key and source
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
# Or use this key.
#wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

# Update the package list again
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins
