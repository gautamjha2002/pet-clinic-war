#!/bin/bash
sudo yum update -y # update all packages

sudo yum install wget git -y

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum upgrade -y

# Add required dependencies for the jenkins package
sudo yum install java-11-openjdk -y
#installing Jenkins
sudo yum install jenkins -y 
# reloading system daemon
sudo systemctl daemon-reload

# enabling jenkins
sudo systemctl enable jenkins

# Starting Jenkins
sudo systemctl start jenkins
