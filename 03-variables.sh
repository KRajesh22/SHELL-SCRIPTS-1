#!/bin/bash

## If you assign a name to a set of data , then we call that name as a variable.
## Syntax:   VAR-NAME=DATA
# Ex:  Class=DevOps

a=10

## We can access a variable using $ symbol before to a variable.
# Ex: $a and you can use these variables with any command.

echo $a 

## Also Sometimes you might face some issues in accessing the variable like in following situation
echo $ax 

# In such cases you can also acccess a variable by using ${a}
echo ${a}x

## Some times we might need a variables defined from our terminal.
## On Shell run the command :: A=100
echo A=$A

## In a case if you want to access any variable from shell then you need to mark/convert that variable to environment variable. and you can do that by running the following command:: export A
