#!/bin/bash
# Safe Modular Script Template
# Demonstrates: set -euo pipefail, trap, functions, local variables.

set -euo pipefail

# Create temporary directory
TEMP_DIR=$(mktemp -d)
echo "Created temp directory: $TEMP_DIR"

cleanup() {
    echo "Running exit trap cleanup..."
    rm -rf "$TEMP_DIR"
    echo "Cleanup complete."
}
trap cleanup EXIT

process_data() {
    local input_file="$1"
    echo "Processing data from local file: $input_file"
}

# Run tasks
process_data "sample_input.txt"
