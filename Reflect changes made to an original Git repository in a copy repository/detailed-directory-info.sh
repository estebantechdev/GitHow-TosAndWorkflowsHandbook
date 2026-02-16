#!/usr/bin/env bash

# Prints out the size, number of files, and number of sub-folders.

# Combine the information into a single command
# echo "Size:" $(du -sh /path/to/directory | cut -f1) \
# "Files:" $(find /path/to/directory -type f | wc -l) \
# "Sub-folders:" $(find /path/to/directory -type d | wc -l)

# Path to the current directory
# DIR_PATH=$(pwd)

# Path to the directory
DIR_PATH="./commbase"

# Get the total size of the directory
DIR_SIZE=$(du -sh "$DIR_PATH" | cut -f1)

# Count the number of files
FILE_COUNT=$(find "$DIR_PATH" -type f | wc -l)

# Count the number of sub-folders
DIR_COUNT=$(find "$DIR_PATH" -type d | wc -l)

# Print the results
echo "Size: $DIR_SIZE"
echo "Files: $FILE_COUNT"
echo "Sub-folders: $((DIR_COUNT - 1))"
