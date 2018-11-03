#!/bin/bash

## Script to install webserver and application and server.
LOG=/tmp/stack.log 
rm -f $LOG 

## Check whether the script executed as root user or normal user.

ID=$(id -u)

echo -e "Installing Web Server"
yum install httpd -y &>>$LOG
if [ $? -eq 0 ]; then
    echo "SUCCESS"
else
    echo "FAILURE"
fi
