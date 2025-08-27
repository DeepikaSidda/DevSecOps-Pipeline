#!/bin/bash
set -xe

# Set Java environment
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH

# Ensure Tomcat ownership
chown -R tomcat:tomcat /usr/local/tomcat9

# Start Tomcat
/usr/local/tomcat/bin/catalina.sh start

# Optional: wait and check if Tomcat is running
sleep 10
if curl -I http://localhost:8080 2>/dev/null | grep "200 OK"; then
    echo "Tomcat is running"
else
    echo "Tomcat not reachable yet"
fi
