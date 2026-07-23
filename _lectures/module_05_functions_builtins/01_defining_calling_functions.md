# Module 5.1: Defining and Calling Functions

## Introduction

Functions in Bash scripting allow you to group a sequence of commands into a reusable block. This promotes modularity, improves readability, and reduces code duplication, making your scripts more organized and easier to maintain. This module will cover how to define functions, call them, and manage their return values.

## Defining Functions

Bash offers two primary syntaxes for defining functions:

### 1. `function_name () { commands; }` (POSIX-compliant)

This is the more common and POSIX-compliant way to define a function. The parentheses are mandatory.

```bash
function_name () {
    commands
}
```

### 2. `function function_name { commands; }` (Bash-specific keyword)

This syntax uses the `function` keyword, which is a Bash extension and not POSIX-compliant. The parentheses are optional with this syntax.

```bash
function function_name {
    commands
}
```

**Example:**

```bash
#!/bin/bash

# POSIX-compliant syntax
greet_user () {
    echo "Hello from the greet_user function!"
}

# Bash-specific syntax
function show_date {
    echo "Today's date is: $(date)"
}
```

## Calling Functions

Once a function is defined, you can call it by simply typing its name, just like any other command.

```bash
#!/bin/bash

greet_user () {
    echo "Hello from the greet_user function!"
}

function show_date {
    echo "Today's date is: $(date)"
}

# Call the functions
greet_user
show_date
```

## Function Arguments

Arguments can be passed to functions just like they are passed to scripts. Inside the function, these arguments are accessed using positional parameters (`$1`, `$2`, `$#`, `$@`, etc.), where `$0` refers to the function's name.

```bash
#!/bin/bash

greet_person () {
    echo "Hello, $1! Welcome to the script."
    echo "You passed $# arguments to this function."
}

# Call the function with arguments
greet_person "Alice"
greet_person "Bob" "Smith"
```

## Return Values and Exit Status

Functions, like commands, return an exit status. By convention, an exit status of `0` indicates success, and any non-zero value indicates an error. The `return` command is used to set the exit status of a function.

*   **`return [n]`**: Exits the function with an exit status `n`. If `n` is omitted, the exit status of the last command executed in the function is used.

The exit status of a function can be checked using the special parameter `$?` immediately after the function call.

```bash
#!/bin/bash

check_file_exists () {
    local filename="$1"
    if [ -f "$filename" ]; then
        return 0 # Success
    else
        return 1 # Failure
    fi
}

# Create a dummy file for testing
touch existing_file.txt

# Test the function
check_file_exists "existing_file.txt"
if [ $? -eq 0 ]; then
    echo "existing_file.txt found."
else
    echo "existing_file.txt not found."
fi

check_file_exists "non_existing_file.txt"
if [ $? -eq 0 ]; then
    echo "non_existing_file.txt found."
else
    echo "non_existing_file.txt not found."
fi

# Clean up
rm existing_file.txt
```

### Returning Data from Functions

While `return` is used for exit status, functions typically return data by:

1.  **Printing to standard output (`echo`, `printf`)**: The caller can capture this output using command substitution (`$(function_name)`).
2.  **Setting global variables**: Although generally discouraged for maintainability, functions can modify global variables.

**Example: Returning data via standard output**

```bash
#!/bin/bash

get_current_time () {
    date +"%H:%M:%S"
}

current_time=$(get_current_time)
echo "The current time is: $current_time"
```

## Best Practices for Functions

*   **Modularity**: Break down complex tasks into smaller, manageable functions.
*   **Reusability**: Write functions that can be reused across different parts of your script or in other scripts.
*   **Clear Naming**: Use descriptive names for your functions (e.g., `process_data`, `validate_input`).
*   **Local Variables**: Use the `local` keyword for variables declared inside functions to prevent them from interfering with global variables or variables in the calling scope. This is crucial for avoiding side effects and making functions self-contained.
*   **Exit Status for Success/Failure**: Use `return 0` for success and `return 1` (or other non-zero values) for failure.
*   **Output for Data**: Use `echo` or `printf` to output data that the calling script needs to capture.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
