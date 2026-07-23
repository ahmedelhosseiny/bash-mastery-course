#!/bin/bash
# Environment Audit Script
# Demonstrates: Environment checking, parameters, exit codes.

echo "=== ENVIRONMENT AUDIT ==="
echo "Current Shell: $BASH"
echo "Bash Version: $BASH_VERSION"
echo "Current User: $USER"
echo "Home Directory: $HOME"
echo "Current Working Dir: $PWD"
echo "Is Shell Interactive? (Check if $- contains 'i')"
if [[ $- == *i* ]]; then
    echo "Interactive shell"
else
    echo "Non-interactive shell"
fi
echo "System Path Variable (PATH):"
echo "$PATH" | tr ':' '\n' | sed 's/^/  /'
