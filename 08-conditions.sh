#!/bin/bash

# Conditions is of two types.
# 1. Case
# 2. If 

UNAME=$(uname)

case $UNAME in 
    Linux) 
            echo "This is Linux OS" 
            ;;
    SunOS) 
            echo "This is SunOS Unix"
            ;;
    *)
            echo "Unknown OS"
            exit 2
            ;;
esac

#### If conditions is usually find in three forms
# Simple-If
# Syntax:
# if [ expression ];then 
#       commands
# fi

#---------------------
# If-Else
# Syntax:
# if [ expression ]; then 
#       commands <- These gets executed if expression is true
# else
#       commands <- These gets executed if expression is false
# fi

# -----------------
# Else-If
# Syntax:
# if [ expression1 ]; then 
#   commands <- These gets executed if expression1 is true
# elif [ expression2 ]; then 
#   commands <- These gets executed if expression2 is true
# else
#   commands  <- These gets executed if bothe expressions are false
# fi

## Expressions
# 1. String Comparisions | Operators : = , !=
# [ abc = abc ] or [ $UNAME = Linux ]
# 2. Number Comp | Operators : -eq, -ne, -gt, -lt, -le , -ge
# [ 1 -eq 1 ]
# 3. File Checks
# ex: Check file exists or not  => [ -f /tmp/abc ]

UNAME=$(uname)
if [ "$UNAME" = Linux ]; then 
    echo "This is Linux OS"
elif [ "$UNAME" = SunOS ]; then 
    echo "This is SunOS Unix"
else 
    echo "Unknown OS"
    exit 2
fi