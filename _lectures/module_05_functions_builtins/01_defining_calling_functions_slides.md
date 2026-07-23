# Module 5.1: Defining and Calling Functions - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Defining and Calling Functions
*   **Subtitle**: Modularizing Your Bash Scripts
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 5.1

## Slide 2: Introduction to Functions
*   Group commands into reusable blocks.
*   Promotes modularity, readability, reduces code duplication.
*   Makes scripts organized and maintainable.

## Slide 3: Defining Functions - Syntax 1 (POSIX-compliant)
*   `function_name () { commands; }`
*   Common and portable.
*   Parentheses are mandatory.
*   Example:
    ```bash
    greet_user () {
        echo "Hello from the greet_user function!"
    }
    ```

## Slide 4: Defining Functions - Syntax 2 (Bash-specific)
*   `function function_name { commands; }`
*   Uses `function` keyword (Bash extension).
*   Parentheses are optional.
*   Example:
    ```bash
    function show_date {
        echo "Today's date is: $(date)"
    }
    ```

## Slide 5: Calling Functions
*   Simply type the function's name.
*   Behaves like any other command.
*   Example:
    ```bash
    greet_user
    show_date
    ```

## Slide 6: Function Arguments
*   Passed like script arguments.
*   Accessed via positional parameters (`$1`, `$2`, `$#`, `$@`).
*   `$0` still refers to the script name.
*   Example:
    ```bash
    greet_person () {
        echo "Hello, $1!"
        echo "You passed $# arguments."
    }
    greet_person "Alice"
    ```

## Slide 7: Return Values and Exit Status
*   Functions return an exit status (0 for success, non-zero for error).
*   `return [n]`: Sets exit status `n`.
*   Check with `$?` after function call.
*   Example:
    ```bash
    check_file_exists () {
        [ -f "$1" ]
    }
    check_file_exists "my_file.txt"
    if [ $? -eq 0 ]; then ... fi
    ```

## Slide 8: Returning Data from Functions
*   **Via Standard Output**: `echo` or `printf`.
    *   Capture with command substitution: `result=$(my_function)`.
*   **Via Global Variables**: (Generally discouraged).

## Slide 9: Best Practices for Functions
*   **Modularity**: Break down tasks.
*   **Reusability**: Write generic functions.
*   **Clear Naming**: Descriptive names.
*   **Local Variables**: Use `local` to prevent side effects.
*   **Exit Status**: For success/failure.
*   **Output**: For data return.

## Slide 10: Conclusion
*   Functions are key for organized and efficient scripts.
*   Mastered defining, calling, passing arguments, and handling return status.
*   Understood best practices for function design.
*   Next: Function Arguments and Scope.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
