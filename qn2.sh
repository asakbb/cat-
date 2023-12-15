#!/bin/bash

# Read the filename from the user
read -p "Enter the filename: " filename

# Check if the file exists
if [ -e "$filename" ]; then
    echo "The file exists."

    # Check if the file is an ordinary file
    if [ -f "$filename" ]; then
        echo "It is an ordinary file."
        echo "Access permissions: $(stat -c %A "$filename")"
        echo "Size: $(stat -c %s "$filename") bytes"
        echo "Last modified: $(stat -c %y "$filename")"
    fi

    # Check if the file is a directory
    if [ -d "$filename" ]; then
        echo "It is a directory."
        files=$(find "$filename" -type f | wc -l)
        directories=$(find "$filename" -type d | wc -l)
        echo "Number of files: $files"
        echo "Number of subdirectories: $directories"
    fi
else
    echo "The file does not exist."
fi


