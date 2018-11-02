#!/bin/bash

## define a function 
example_f() {
    echo "Hey I am an example function"
}

## Call the function 
example_f 

#------------------

# access a variable inside a function
example1_f() {
    echo "Value of A = $a"
}

a=10
example1_f

#-----------
# define a variable inside a function
example2_f() {
    a=20
}

example2_f
echo Value of A = $a

# -------
# Parse arguments to a function
example3_f() {
    echo "First Argument = $1"
    echo "All Arguments = $*"
}

example3_f 123 xyz

## -----------
# Exit from function , but not from script 
example4_f() {
    echo Hello 
    return 1
    echo Bye
}

example4_f
echo "Exit Status of example4_f = $?"