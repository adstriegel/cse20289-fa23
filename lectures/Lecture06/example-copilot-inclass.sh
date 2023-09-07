#!/bin/sh

# Count the lines of code in a given file from the argument
# and print the result to the terminal

# Check if the user has provided a file name
if [ $# -eq 0 ]; then
    echo "Please provide a file name"
    exit 1
fi

# Check if the file exists
if [ ! -f $1 ]; then
    echo "File $1 does not exist"
    exit 1
fi

# Count the lines of code in the file
lines=$(wc -l < $1)

# Print the result
echo "File $1 has $lines lines of code"
```
