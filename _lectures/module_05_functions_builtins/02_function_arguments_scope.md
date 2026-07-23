# Module 5.2: Function Arguments and Scope

## Introduction

When working with functions in Bash, it's crucial to understand how arguments are passed to them and how variables behave within different scopes. Proper handling of arguments and variable scope ensures that your functions are robust, predictable, and don't inadvertently affect other parts of your script.

## Function Arguments

Arguments are data passed to a function when it is called. Inside the function, these arguments are accessed using the same positional parameters (`$1`, `$2`, etc.) that are used for script arguments. The special variables `$#`, `$@`, and `$*` also apply to function arguments.

### Accessing Arguments

*   `$1`, `$2`, ...: Individual arguments.
*   `$#`: Number of arguments passed to the function.
*   `$@`: All arguments as separate strings (best for iterating).
*   `$*`: All arguments as a single string.
*   `$0`: Within a function, `$0` still refers to the name of the script itself, not the function name. To get the function name, you can use `FUNCNAME[0]` (Bash-specific) or pass it as an explicit argument.

**Example:**

```bash
#!/bin/bash

process_args () {
    echo "Function name: ${FUNCNAME[0]}" # Bash-specific
    echo "Script name (from within function): $0"
    echo "Number of arguments received: $#"
    echo "First argument: $1"
    echo "All arguments (as separate strings): $@"

    for arg in "$@"; do
        echo "Processing argument: $arg"
    done
}

process_args "file1.txt" "config file" 123
```

### Shifting Arguments

The `shift` command can be used within a function (or script) to discard a specified number of positional parameters from the left. This is particularly useful when processing a variable number of arguments or options.

```bash
#!/bin/bash

process_options () {
    echo "Initial arguments: $@"
    while (( "$#" > 0 )); do
        case "$1" in
            -a|--alpha)
                echo "Option -a detected."
                ;;
            -b|--beta)
                echo "Option -b detected."
                ;;
            *)
                echo "Unknown option or argument: $1"
                ;;
        esac
        shift # Move to the next argument
    done
    echo "Remaining arguments after shift: $@"
}

process_options -a --beta some_file.txt
```

## Variable Scope (Global vs. Local)

Variable scope determines where a variable can be accessed and modified within your script. Bash variables are global by default, which can lead to unintended side effects if not managed carefully. The `local` keyword is used to create local variables within functions.

### Global Variables

By default, any variable defined in a script (outside a function) or within a function without the `local` keyword is a global variable. This means it can be accessed and modified from anywhere in the script, including inside functions.

**Example of Global Variable:**

```bash
#!/bin/bash

GLOBAL_VAR="I am global"

my_function () {
    echo "Inside function, GLOBAL_VAR is: $GLOBAL_VAR"
    GLOBAL_VAR="I was changed by the function"
}

echo "Before function call, GLOBAL_VAR is: $GLOBAL_VAR"
my_function
echo "After function call, GLOBAL_VAR is: $GLOBAL_VAR"
```

While global variables can be convenient, they can make scripts harder to debug and maintain, as a change in one part of the script can have unexpected consequences elsewhere.

### Local Variables (`local` keyword)

To prevent functions from accidentally modifying global variables or variables in the calling environment, you should declare variables inside functions as `local`. A local variable is only accessible within the function where it is defined and its child functions.

**Syntax:**

```bash
function_name () {
    local local_var="This is local"
    # ...
}
```

**Example of Local Variable:**

```bash
#!/bin/bash

GLOBAL_VAR="I am global"

my_function () {
    local GLOBAL_VAR="I am local to the function" # This creates a new local variable named GLOBAL_VAR
    local LOCAL_VAR="I am truly local"
    echo "Inside function, GLOBAL_VAR is: $GLOBAL_VAR"
    echo "Inside function, LOCAL_VAR is: $LOCAL_VAR"
}

echo "Before function call, GLOBAL_VAR is: $GLOBAL_VAR"
my_function
echo "After function call, GLOBAL_VAR is: $GLOBAL_VAR"
echo "Attempting to access LOCAL_VAR outside function: $LOCAL_VAR" # This will be empty
```

In this example, the `GLOBAL_VAR` inside `my_function` is a *different* variable from the `GLOBAL_VAR` outside the function because it was declared with `local`. The global `GLOBAL_VAR` remains unchanged.

### Best Practices for Scope

*   **Default to `local`**: Always declare variables within functions using `local` unless you specifically intend for them to be global or modify an existing global variable.
*   **Pass arguments explicitly**: Rely on positional parameters (`$1`, `$2`, etc.) to pass data into functions rather than expecting functions to read global variables. This makes functions more self-contained and reusable.
*   **Minimize global variables**: Limit the use of global variables to essential configuration settings that truly need to be accessible everywhere.
*   **Document**: Clearly document which variables a function uses or modifies, especially if it interacts with global scope.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
