# Essential Bash Built-ins Reference

*   `set -e`: Exit immediately if any command returns non-zero.
*   `set -u`: Treat unset variables as an error.
*   `set -o pipefail`: Return pipeline exit code based on last non-zero command.
*   `shopt -s extglob`: Enable extended pattern matching.
*   `declare -a / -A`: Declare indexed / associative arrays.
*   `declare -n`: Create nameref variables (references to other variables).
*   `read -r`: Read standard input safely, preserving backslashes.
*   `printf`: Formatted output printing.
*   `trap`: Catch system signals (SIGINT, EXIT, ERR).
*   `eval`: Evaluate and run a string as a command.
*   `exec`: Replace the current shell process with a command.
