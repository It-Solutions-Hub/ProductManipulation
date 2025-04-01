#!/bin/bash

# Define variables
TOMCAT_DIR="/usr/local/tomcat/tomcat"
WEBAPPS_DIR="$TOMCAT_DIR/webapps"
WAR_FILE="ProductManipulation.war"
S3_BUCKET="test-bucket-cicd-pipeline"

# Stop Tomcat before deploying
sudo $TOMCAT_DIR/bin/shutdown.sh

# Ensure old deployment is removed
sudo rm -rf $WEBAPPS_DIR/ProductManipulation*

# Download the new WAR file from S3
aws s3 cp s3://$S3_BUCKET/$WAR_FILE /tmp/$WAR_FILE

# Move the new WAR file to Tomcat's webapps folder
sudo mv /tmp/$WAR_FILE $WEBAPPS_DIR/

# Start Tomcat after deployment
sudo $TOMCAT_DIR/bin/startup.sh

echo "Deployment completed successfully!"
