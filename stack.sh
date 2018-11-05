#!/bin/bash

## Script to install webserver and application and server.
LOG=/tmp/stack.log 
rm -f $LOG 

## COlor Variables
R="\e[1;31m"
G="\e[1;32m"
Y="\e[1;33m"
N="\e[0m"

## 
TOMCAT_USER=studentapp
TOMCAT_VERSION="9.0.12"
TOMCAT_URL="https://archive.apache.org/dist/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz"


Error() {
    echo -e "${R}${1}${N}"
    exit $2
}

Info() {
    echo -e -n "$1 "
}

Stat() {
    if [ $1 -eq 0 ]; then 
        echo -e "-- ${G}SUCCESS${N}"
    else 
        echo -e "-- ${R}FAILURE${N}"
        exit 1
    fi
}

LogS() {
    case $1 in 
        Head) 
            echo -e "\n----------------------------------------------------------------------" &>>$LOG
            echo -e "                             $2                                       " &>>$LOG
            echo -e "----------------------------------------------------------------------" &>>$LOG
            ;;
        Tail) 
            echo -e "----------------------------------------------------------------------\n" &>>$LOG
            ;;
    esac
}

Run() {
    Info "$1"
    LogS Head "$2"
    $2 &>>$LOG
    Stat $?
    LogS Tail
}

Head() {
    echo -e "\n\t\e[1;4;36m$1$N"
}

## Check whether the script executed as root user or normal user.

ID=$(id -u)
if [ "$ID" -ne 0 ]; then 
    Error "You should be a root user to run this script!!" 2
fi


Head "WEBSERVER SETUP"
Run "Installing HTTPD Server" "yum install httpd -y"  
Run "Setting up Reverse proxy" "curl -f -s https://raw.githubusercontent.com/citb32/project-setup/master/web-proxy.conf -o  /etc/httpd/conf.d/studentapp.conf"
Run "Setting Up Index File" "curl -f -s https://raw.githubusercontent.com/citb32/project-setup/master/httpd-index.html -o /var/www/html/index.html"
systemctl enable httpd &>/dev/null
Run "Start Web Service" "systemctl start httpd"

Head "APPLICATION SETUP"
Run "Installing Java" "yum install java -y"  
Run "Creating Application User" "useradd $TOMCAT_USER"
Run "Downloading Tomcat" "su - $TOMCAT_USER -c 'wget -O- $TOMCAT_URL | tar -xz' "
