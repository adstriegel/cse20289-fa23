#!/bin/sh

# Find the biggest source file in the directory

# Initialize the biggest file to the empty string
biggest=""
# Initialize the biggest file size to 0
size=0

# Loop through all the files in the directory
SrcFiles=`find $1 -name "*.cc" -print`
for file in $SrcFiles
do
    # Get the size of the file
    filesize=`ls -l $file | awk '{print $5}'`
    # If the file is bigger than the biggest file so far
    if [ $filesize -gt $size ]
    then
        # Update the biggest file and its size
        biggest=$file
        size=$filesize
    fi
done

# Print the biggest file and its size
echo "The biggest file is $biggest"
echo "The size of the biggest file is $size bytes"
