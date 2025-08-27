#!/bin/bash
set -xe

# Set Java environment
export JAVA_HOME=/usr/lib/jvm/java-24-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH

# Ensure Tomcat ownership
chown -R tomcat:tomcat /usr/local/tomcat

# Start Tomcat
/usr/local/tomcat/bin/catalina.sh start

# Health check with retries
NUMBER_OF_ATTEMPTS=20
SLEEP_TIME=5
APP_URL="http://localhost:8080/index.jsp"   # 👈 Update this to your app context (e.g., /myapp/)

for i in `seq 1 $NUMBER_OF_ATTEMPTS`; do
    HTTP_CODE=$(curl --insecure --write-out '%{http_code}' -o /dev/null -m 10 -q -s "$APP_URL")
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Tomcat is running and returned 200!"
        exit 0
    fi
    echo "Attempt $i: Tomcat not ready (HTTP $HTTP_CODE). Retrying in $SLEEP_TIME sec..."
    sleep $SLEEP_TIME
done

echo "Server did not come up after expected time. Failing."
exit 1
