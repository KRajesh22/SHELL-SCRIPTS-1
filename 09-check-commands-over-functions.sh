#!/bin/bash 

Run() {
    echo "$1"
    $2
}

Run "Test" "echo Hello World"

Run "Test1"