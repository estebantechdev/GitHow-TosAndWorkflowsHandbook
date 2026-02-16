#!/usr/bin/env bash

# topics.txt should contain the list (one per line, including *)
INPUT_FILE="topics.txt"

while IFS= read -r line; do
    # Skip empty lines
    [[ -z "$line" ]] && continue

    # Remove leading "* " and "TODO:"
    clean="${line#\* }"
    clean="${clean#TODO: }"

    # Convert to lowercase
    clean=$(echo "$clean" | tr '[:upper:]' '[:lower:]')

    # Replace spaces with underscores
    clean=$(echo "$clean" | tr ' ' '_')

    # Remove special characters except _ and .
    clean=$(echo "$clean" | sed 's/[^a-z0-9_.-]//g')

    filename="${clean}.md"

    # Create file if it does not exist
    if [[ ! -f "$filename" ]]; then
        touch "$filename"
        echo "Created $filename"
    else
        echo "Skipped $filename (already exists)"
    fi
done < "$INPUT_FILE"
