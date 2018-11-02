#!/bin/bash

## Special variables are 0-n, * , @ , #, $

## $0 is the reference for your script name
echo 'Script Name = ' $0

## First argument parsed to the script
echo 'First Argument = '$1
echo 'Second Argument = ' $2

## All the input the user parsed
echo 'All Arguments = ' $*
echo 'All Arguments = ' $@

## $$ is a PID of the script 
echo 'PID of script = '$$