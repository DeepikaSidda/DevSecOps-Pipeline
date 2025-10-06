#!/bin/bash
set -xe

# Variables
S3_BUCKET="s3://my-codedeploy-artifacts-1"   # Your exact bucket
TOMCAT_WEBAPP="/opt/tomcat/webapps"

# Copy all files from S3 bucket recursively to Tomcat webapps
aws s3 cp $S3_BUCKET $TOMCAT_WEBAPP --recursive --region us-east-1

# Ensure proper ownership
chown -R tomcat:tomcat $TOMCAT_WEBAPP

# Restart Tomcat to deploy new WARs
systemctl restart tomcat
