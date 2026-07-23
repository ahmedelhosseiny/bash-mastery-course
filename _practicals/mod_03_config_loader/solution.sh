#!/bin/bash
# Configuration Loader Script
# Demonstrates: Associative Arrays (declare -A), reading files, parameter checks.

declare -A config_arr

# Sample config content
CONFIG_CONTENT="
# App configurations
host=localhost
port=8080
db_user=admin
"

while IFS='=' read -r key val; do
    # Skip empty lines or comment lines
    [[ -z "$key" || "$key" == "#"* ]] && continue
    # Trim whitespaces
    key=$(echo "$key" | xargs)
    val=$(echo "$val" | xargs)
    config_arr["$key"]="$val"
done <<< "$CONFIG_CONTENT"

# Print details
for k in "${!config_arr[@]}"; do
    echo "Key: $k -> Value: ${config_arr[$k]}"
done
