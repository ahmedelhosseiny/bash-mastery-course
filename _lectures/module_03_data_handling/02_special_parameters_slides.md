# Module 3.2: Special Parameters - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Special Parameters
*   **Subtitle**: Script Execution, Arguments, and Status
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 3.2

## Slide 2: Introduction
*   Bash automatically sets special parameters.
*   Provide crucial info about script execution, arguments, and status.
*   Vital for writing robust and dynamic Bash scripts.

## Slide 3: Positional Parameters
*   Arguments passed to a script or function.
*   **`$0`**: Name of the script/function itself [1].
*   **`$1`, `$2`, ...**: Individual arguments [1].
*   **`$#`**: Number of arguments [1].
*   **`$*`**: All arguments as a single string [1].
*   **`$@`**: All arguments as separate words (preferred for iteration) [1].

## Slide 4: Positional Parameters Example
*   **Script `args.sh`:**
    ```bash
    #!/bin/bash
    echo "Script name: $0"
    echo "First argument: $1"
    echo "Number of arguments: $#"
    echo "All arguments (quoted \"$@\"): \"$@\""
    ```
*   **Execution**: `bash args.sh "hello world" 123`
*   **Output**: Shows how each parameter expands.

## Slide 5: Other Special Parameters: Exit Status and PIDs
*   **`$?`**: Exit status of the most recent foreground command [1].
    *   `0`: Success; Non-zero: Error.
    *   Example: `ls /nonexistent; echo $?`
*   **`$$`**: Process ID (PID) of the current shell [1].
    *   Example: `echo "Current shell PID: $$"`
*   **`$!`**: PID of the last command executed in the background [1].
    *   Example: `sleep 5 &; echo "Background PID: $!"`

## Slide 6: Other Special Parameters: Shell Options and Last Argument
*   **`$-`**: Current options set for the shell [1].
    *   Example: `echo "Current options: $- "`
*   **`$_`**: Last argument of the previous command after expansion [1].
    *   Example: `echo "Hello World"; echo "Last arg: $_"`

## Slide 7: When to Use Special Parameters
*   **`$0`**: Error messages, logging, script name.
*   **`$1`, `$2`, ...**: Access specific arguments.
*   **`$#`**: Check argument count.
*   **`"$@"`**: Iterate over arguments, preserving spaces.
*   **`$?`**: Error checking, conditional execution.
*   **`$$`**: Unique temporary filenames, process identification.
*   **`$!`**: Monitor/manage background processes.

## Slide 8: Conclusion
*   Special parameters provide dynamic information about script context.
*   Positional parameters are crucial for handling script inputs.
*   Exit status, PIDs, and shell options aid in robust scripting.
*   Next: Arrays.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
