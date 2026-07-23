# Module 5.3: Script Structure and Best Practices

## Introduction

Writing effective Bash scripts goes beyond knowing commands and syntax; it involves structuring your code in a way that is readable, maintainable, and robust. Adhering to best practices ensures that your scripts are reliable, easy to debug, and can be understood by others (or your future self).

## Script Structure

A well-structured Bash script typically follows a logical flow:

1.  **Shebang Line (`#!`)**
2.  **Comments**
3.  **Global Variables and Configuration**
4.  **Functions**
5.  **Main Logic / Script Execution**
6.  **Error Handling / Exit Status**

### 1. Shebang Line (`#!`)

The very first line of every executable Bash script should be the shebang line. It tells the operating system which interpreter to use to execute the script.

```bash
#!/bin/bash
```

*   **`#!/bin/bash`**: Specifies that the script should be executed with Bash, located at `/bin/bash`.
*   **`#!/usr/bin/env bash`**: A more portable alternative. `env` finds the `bash` executable in the user's `PATH`, which can be useful if Bash is not always in `/bin/bash`.

### 2. Comments

Comments are crucial for explaining what your script does, why it does it, and how it works. Use `#` for single-line comments.

```bash
#!/bin/bash

# This is a single-line comment.
# This script performs a backup of important files.

# A function to log messages
log_message () {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}
```

### 3. Global Variables and Configuration

Define any global variables, constants, or configuration settings at the beginning of your script. This makes them easy to find and modify.

```bash
#!/bin/bash

# Configuration
BACKUP_DIR="/var/backups"
SOURCE_DIR="/home/user/documents"
LOG_FILE="/var/log/backup.log"
DATE_FORMAT="+%Y%m%d_%H%M%S"
```

### 4. Functions

Organize reusable blocks of code into functions. Define them after global variables but before the main script logic. This improves modularity and readability.

```bash
# ... (shebang, comments, global variables)

# Function to perform the backup
perform_backup () {
    local timestamp=$(date "$DATE_FORMAT")
    local backup_file="$BACKUP_DIR/documents_backup_$timestamp.tar.gz"
    log_message "Starting backup of $SOURCE_DIR to $backup_file"
    tar -czf "$backup_file" "$SOURCE_DIR"
    if [ $? -eq 0 ]; then
        log_message "Backup successful."
        return 0
    else
        log_message "Backup failed!"
        return 1
    fi
}

# ... (other functions)
```

### 5. Main Logic / Script Execution

The main part of your script, where the primary actions are performed, should come after function definitions. This often involves calling the functions you've defined.

```bash
# ... (functions)

# Main script execution
log_message "Script started."
perform_backup

if [ $? -eq 0 ]; then
    log_message "Script finished successfully."
    exit 0
else
    log_message "Script finished with errors."
    exit 1
fi
```

## Best Practices

### Readability and Maintainability

*   **Consistent Indentation**: Use spaces (2 or 4) or tabs consistently for indentation to clearly show code blocks.
*   **Meaningful Names**: Use descriptive names for variables and functions (e.g., `user_name`, `process_data`, `log_error`).
*   **Blank Lines**: Use blank lines to separate logical blocks of code, making the script easier to scan.
*   **Line Length**: Keep lines reasonably short (e.g., 80-100 characters) for better readability.

### Robustness and Error Handling

*   **`set -e`**: Exit immediately if a command exits with a non-zero status. This prevents scripts from continuing after an error has occurred.
    ```bash
    #!/bin/bash
    set -e
    # ... rest of script
    ```
*   **`set -u` or `set -o nounset`**: Treat unset variables and parameters as an error when performing parameter expansion. This helps catch typos and uninitialized variables.
    ```bash
    #!/bin/bash
    set -u
    # ... rest of script
    ```
*   **`set -o pipefail`**: If any command in a pipeline fails, the entire pipeline's exit status will be that of the rightmost command that exited with a non-zero status. Without this, a pipeline's exit status is typically that of the last command, even if an earlier command failed.
    ```bash
    #!/bin/bash
    set -o pipefail
    # ... rest of script
    ```
*   **`set -x`**: Print commands and their arguments as they are executed. Useful for debugging.
    ```bash
    #!/bin/bash
    set -x
    # ... rest of script
    ```
*   **Check Exit Status**: Always check the exit status (`$?`) of critical commands, especially in `if` statements, to ensure they succeeded.
*   **Validate Input**: Validate command-line arguments and user input to prevent unexpected behavior or security vulnerabilities.
*   **Use `local` for Function Variables**: As discussed in Module 5.2, use `local` to prevent unintended side effects from functions modifying global variables.
*   **Quote Variables**: Always double-quote variables (`"$VAR"`) to prevent word splitting and globbing issues.

### Security Considerations

*   **Avoid `eval`**: The `eval` command can be dangerous as it executes arbitrary strings as commands. Use it with extreme caution and only with trusted input.
*   **Sanitize Input**: Never trust user input. Always sanitize and validate any input that might be used in commands or file paths.
*   **Minimize Privileges**: Run scripts with the minimum necessary privileges. Avoid running everything as root unless absolutely necessary.

## Example Script Template

```bash
#!/bin/bash
#
# Script Name: my_script.sh
# Description: A brief description of what the script does.
# Author: Your Name
# Date: YYYY-MM-DD
# Version: 1.0
#

# --- Configuration --- #
# Set script options for robustness
set -euo pipefail

# Global variables
LOG_FILE="/var/log/my_script.log"

# --- Functions --- #

# Function to log messages
log_message () {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to display usage information
usage () {
    echo "Usage: $0 [-h] <argument1>"
    echo "  -h: Display this help message."
    exit 1
}

# Function to process an argument
process_argument () {
    local arg="$1"
    log_message "Processing argument: $arg"
    # Add your processing logic here
    return 0 # Indicate success
}

# --- Main Script Logic --- #

# Parse command-line options (if any)
while getopts "h" opt; do
    case "$opt" in
        h)
            usage
            ;;
        \?)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

# Check for required arguments
if [ "$#" -lt 1 ]; then
    log_message "Error: Missing required argument."
    usage
fi

log_message "Script started."

# Call main processing function
if process_argument "$1"; then
    log_message "Script finished successfully."
    exit 0
else
    log_message "Script finished with errors."
    exit 1
fi
```

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
