#!/bin/sh

PORT=${PORT:-80}

sed -i "s/port=\"8080\"/port=\"$PORT\"/" /usr/local/tomcat/conf/server.xml

exec /usr/local/tomcat/bin/catalina.sh run
