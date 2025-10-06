#!/bin/bash
set -xe

# Define variables
S3_BUCKET="s3://my-codedeploy-artifacts-1"
TOMCAT_WEBAPP="/usr/local/tomcat9/webapps"

# Copy WAR file from S3 bucket to Tomcat webapps folder
# If you know the exact WAR file name, you can specify it instead of --recursive
aws s3 cp $S3_BUCKET $TOMCAT_WEBAPP --recursive --region us-east-1

# Ensure the ownership permissions are correct
chown -R tomcat:tomcat $TOMCAT_WEBAPP
