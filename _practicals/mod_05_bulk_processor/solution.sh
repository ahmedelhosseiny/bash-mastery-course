#!/bin/bash
# Bulk File Processor using Parameter Expansions
# Demonstrates: ${var//search/replace}, lowercasing ${var,,}.

for file in *; do
    # Skip if it is a directory or the script itself
    [[ -d "$file" || "$file" == "$0" ]] && continue
    
    # 1. Lowercase file name
    new_name="${file,,}"
    # 2. Replace spaces with underscores
    new_name="${new_name// /_}"
    
    if [ "$file" != "$new_name" ]; then
        echo "Renaming '$file' to '$new_name'"
        mv "$file" "$new_name"
    fi
done
