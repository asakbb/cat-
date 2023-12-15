#!/bin/bash

# Check the number of command line arguments
if [ $# -ne 1 ]; then
    echo "Hey, please provide exactly one positive integer as a command line argument."
    exit 1
fi

# Check if the command line argument is a positive integer
if ! [[ $1 =~ ^[1-9][0-9]*$ ]]; then
    echo "Oops, the command line argument is not a positive integer."
    exit 1
fi

# Function to calculate the sum of digits
get_sum_of_digits() {
    local number=$1
    local sum=0
    while [ $number -gt 0 ]; do
        digit=$(( number % 10 ))
        sum=$(( sum + digit ))
        number=$(( number / 10 ))
    done
    echo $sum
}

# Function to calculate the product of digits
get_product_of_digits() {
    local number=$1
    local product=1
    while [ $number -gt 0 ]; do
        digit=$(( number % 10 ))
        product=$(( product * digit ))
        number=$(( number / 10 ))
    done
    echo $product
}

# Function to check if a number is a palindrome
is_palindrome() {
    local number=$1
    local reverse=0
    local original=$number
    while [ $number -gt 0 ]; do
        digit=$(( number % 10 ))
        reverse=$(( reverse * 10 + digit ))
        number=$(( number / 10 ))
    done
    if [ $original -eq $reverse ]; then
        echo "Yes, the number is a palindrome."
    else
        echo "No, the number is not a palindrome."
    fi
}

# Function to check if a number is prime
is_prime() {
    local number=$1
    if [ $number -eq 1 ]; then
        echo "No, the number is not prime."
        return
    fi
    for (( divisor=2; divisor*divisor<=number; divisor++ )); do
        if [ $(( number % divisor )) -eq 0 ]; then
            echo "No, the number is not prime."
            return
        fi
    done
    echo "Yes, the number is prime."
}

# Main script
number=$1

# Menu for user choice



# Main script
number=$1

# Menu for user choice
echo "What would you like to do with the number $number?"
echo "1. Display the sum and product of the digits"
echo "2. Check if the number is a palindrome"
echo "3. Check if the number is prime"

# Read user's choice
read -p "Enter your choice (1, 2, or 3): " choice

# Perform the chosen operation
case $choice in
    1)
        sum=$(get_sum_of_digits $number)
        product=$(get_product_of_digits $number)
        echo "The sum of the digits is: $sum"
        echo "The product of the digits is: $product"
        ;;
    2)
        is_palindrome $number
        ;;
    3)
       is_prime $number
        ;;
    *)
        echo "Oops, that's an invalid choice. Please choose 1, 2, or 3."
        ;;
esac
