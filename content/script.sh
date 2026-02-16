#!/usr/bin/env bash

# Directory to process (current directory by default)
DIR="${1:-.}"

cd "$DIR" || exit 1

for file in *; do
  # Skip if it's already a directory
  [ -d "$file" ] && continue

  # Remove extension
  name="${file%.*}"

  # Create directory if it doesn't exist
  mkdir -p "$name"
done
