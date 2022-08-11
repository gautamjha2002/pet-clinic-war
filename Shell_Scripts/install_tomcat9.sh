#!/bin/bash

# Update the packages
sudo yum update -y

# Installing wget

sudo yum install wget -y

# Installing JAVA
sudo yum install java-11-openjdk -y

# Downloading tomcat 9 tar file

wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz 

# Extracting tar file
sudo tar xvf apache-tomcat-9.0.65.tar.gz -C /usr/share

# Create a symlink for tomcat to easy update
sudo ln -s /usr/share/apache-tomcat-9.0.65/ /usr/share/tomcat
