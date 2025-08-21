#!/bin/bash
set -xe

# Set Java environment
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH

# Ensure Tomcat ownership
chown -R tomcat:tomcat /usr/local/tomcat9

# Start Tomcat using catalina.sh
sudo -u tomcat /usr/local/tomcat9/bin/startup.sh

# Optional: wait and check if Tomcat is running
sleep 10
curl -I http://localhost:8080 || echo "Tomcat not reachable yet"
