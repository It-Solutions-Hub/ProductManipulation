#!/bin/bash

# Update system packages
sudo yum update -y

# Install Java 17 (Amazon Corretto)
sudo yum install java-17-amazon-corretto-devel -y

sudo mkdir -p /usr/local/tomcat
cd /usr/local/tomcat
# Download Apache Tomcat v8.5:
sudo curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.0/bin/apache-tomcat-8.5.0.tar.gz
# Extract the Tomcat archive:
sudo tar xvf apache-tomcat-8.5.0.tar.gz
# Rename the extracted directory to tomcat:
sudo mv apache-tomcat-8.5.0 tomcat
# Verify the extracted directory:
sudo ls -l /usr/local/tomcat/tomcat
# Start Tomcat:
sudo /usr/local/tomcat/tomcat/bin/startup.sh

echo "Tomcat 9 installed and started successfully!"
