#!/bin/bash

## Script to install webserver and application and server.
LOG=/tmp/stack.log 
rm -f $LOG 

## COlor Variables
R="\e[1;31m"
G="\e[1;32m"
Y="\e[1;33m"
N="\e[0m"

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
    LogS Tail
    Stat $?
}

## Check whether the script executed as root user or normal user.

ID=$(id -u)
if [ "$ID" -ne 0 ]; then 
    Error "You should be a root user to run this script!!" 2
fi

Run "Installing HTTPD Server" "yum install httpd -y"  
Run "Setting up Reverse proxy" "wget "