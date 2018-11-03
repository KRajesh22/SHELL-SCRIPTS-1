#!/bin/bash

## Script to install webserver and application and server.
LOG=/tmp/stack.log 
rm -f $LOG 

## COlor Variables
R="\e[31m"
N="\e[0m"

Error() {
    echo -e "${R}${1}${N}"
    exit $2
}

Info() {
    echo -e -n ""
}

## Check whether the script executed as root user or normal user.

ID=$(id -u)
if [ "$ID" -ne 0 ]; then 
    Error "You should be a root user to run this script!!" 2
fi

Info "Installing Web Server"
yum install httpd -y &>>$LOG
if [ $? -eq 0 ]; then
    echo "SUCCESS"
else
    echo "FAILURE"
fi
