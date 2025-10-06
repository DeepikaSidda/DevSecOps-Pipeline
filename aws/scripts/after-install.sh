#!/bin/bash
set -xe

# Define variables
S3_BUCKET="s3://my-github-my-codedeploy-artifacts-1"
TOMCAT_WEBAPP="/usr/local/tomcat9/webapps"

# Copy WAR file from S3 bucket to Tomcat webapps folder
# If you know the exact WAR file name, use it instead of --recursive
aws s3 cp $S3_BUCKET $TOMCAT_WEBAPP --recursive

# Ensure the ownership permissions are correct
chown -R tomcat:tomcat $TOMCAT_WEBAPP
