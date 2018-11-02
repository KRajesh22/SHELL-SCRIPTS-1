#!/bin/bash

## To print a string from shell script you can use echo/printf command. Preferred one is echo command.
echo Hello World

## To print multiline output
echo Hello
echo World 

## We can use esacape sequences and we can do that multi line output with single echo command.

echo Hello\nWorld

## Whenever you use escape sequence in input then use enable escape sequence option in echo command and it is -e

echo -e Hello\nWorld

## Whenever you use escape sequence option , then it is always preferred to provide input in double quotes.
echo -e "Hello\nWorld"

## We manjorly use escape squences which are
## \n - new line
## \t - new tab space
## \e - new color

## Colors in Shell Scripting Ouptputs 
## Colors are of two type one is foreground(text color) and other one in background(terminal color)
## There are total 6 colors available in shell 

##      Color       Foreground          Background
#       Red             31                  41
#       Green           32                  42
#       Yellow          33                  43
#       Blue            34                  44
#       Magenta         35                  45
#       Cyan            36                  46

## To enable the color, follwoing is the syntax
## \e[COLm,    echo -e "\e[COLmHello World"

echo -e "\e[31mRed Foreground Color"
echo -e "\e[32mGreen Foreground Color"
echo -e "\e[33mYellow Foreground Color"
echo -e "\e[34mBlue Foreground Color"
echo -e "\e[35mMagenta Foreground Color"
echo -e "\e[36mCyan Foreground Color"

## To print both foreground and background colors
# \e[BG-COL;FG-COLm
echo -e "\e[43;31mRed on Yellow"

## Color will get tailed with previous echo commands, To avoid that we need to disable the color after printing the text in color.
# echo -e "<ENABLE-COLOR>TEXT<DISABLE-COLOR>"
# TO disable color again you have to use escape sequence with color code 0.
echo -e "\e[43;31mRed on Yellow\e[0m"


### Sometimes we need data dynamically, By running some commands we generate output and if we need to store that output to a variable then we use command substutions for variables.

echo "Good Morning , Today date is 2018-11-02"

DATE=$(date +%F)
echo "Good Morning , Today date is $DATE"

## In the same manner we have artithematic substution to define the variable by running arithematic expression
ADD=$((5*20/1-2))
echo ADD = $ADD