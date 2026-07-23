# Module 5.2: Function Arguments and Scope - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Function Arguments and Scope
*   **Subtitle**: Managing Data Flow in Bash Functions
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 5.2

## Slide 2: Introduction
*   Crucial to understand how arguments are passed.
*   How variables behave within different scopes (global vs. local).
*   Ensures robust, predictable functions without side effects.

## Slide 3: Function Arguments
*   Accessed using positional parameters (`$1`, `$2`, etc.).
*   `$#`: Number of arguments.
*   `$@`: All arguments as separate strings (for iteration).
*   `$*`: All arguments as a single string.
*   `$0`: Still refers to the script name, not function name.

## Slide 4: Function Arguments Example
```bash
#!/bin/bash

process_args () {
    echo "Number of arguments: $#"
    echo "First argument: $1"
    for arg in "$@"; do
        echo "Processing: $arg"
    done
}

process_args "file1.txt" "config file" 123
```

## Slide 5: Shifting Arguments (`shift`)
*   Discards a specified number of positional parameters from the left.
*   Useful for processing options or variable arguments.
*   Example:
    ```bash
    process_options () {
        while (( "$#" > 0 )); do
            echo "Current arg: $1"
            shift
        done
    }
    process_options -a -b file.txt
    ```

## Slide 6: Variable Scope: Global Variables
*   Defined outside functions or inside without `local`.
*   Accessible and modifiable from anywhere in the script.
*   Can lead to unintended side effects.
*   Example:
    ```bash
    GLOBAL_VAR="I am global"
    my_function () { GLOBAL_VAR="Changed"; }
    my_function
    echo $GLOBAL_VAR # Output: Changed
    ```

## Slide 7: Variable Scope: Local Variables (`local` keyword)
*   Declared inside functions using `local`.
*   Only accessible within the function and its child functions.
*   Prevents interference with global variables.
*   Example:
    ```bash
    GLOBAL_VAR="I am global"
    my_function () {
        local GLOBAL_VAR="I am local";
        local LOCAL_VAR="Truly local";
        echo "Inside: $GLOBAL_VAR, $LOCAL_VAR"
    }
    my_function
    echo "Outside: $GLOBAL_VAR" # Output: I am global
    ```

## Slide 8: Best Practices for Scope
*   **Default to `local`**: For all variables within functions.
*   **Pass arguments explicitly**: Use `$1`, `$2` instead of relying on global variables.
*   **Minimize global variables**: Use only for essential configuration.
*   **Document**: Clearly state variable usage.

## Slide 9: Conclusion
*   Understood how to pass and access function arguments.
*   Mastered the distinction between global and local variables.
*   Learned to use `local` for preventing side effects.
*   Next: Script Structure and Best Practices.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
