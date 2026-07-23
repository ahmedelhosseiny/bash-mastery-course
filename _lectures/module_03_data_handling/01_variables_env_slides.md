# Module 3.1: Shell Variables and Environment Variables - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Shell Variables and Environment Variables
*   **Subtitle**: Storing and Managing Data in Bash
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 3.1

## Slide 2: Introduction
*   Variables are fundamental for storing data.
*   Refer to data by name (text strings, numbers).
*   Distinguish between shell variables and environment variables.

## Slide 3: Shell Variables
*   **Definition**: Specific to the current shell session.
*   **Purpose**: Store temporary data within the session.
*   **Defining/Assigning**: `my_variable="Hello Bash"` (no spaces around `=`).
*   **Rules for Names**:
    *   Alphanumeric, underscores.
    *   Cannot start with a number.
    *   Case-sensitive.
*   **Accessing**: Prefix with `$`, use `${variable}` for clarity.
    *   Example: `echo $my_variable`, `echo "Value: ${my_variable}_suffix"`

## Slide 4: Modifying and Unsetting Shell Variables
*   **Modifying**: Reassign values at any time.
    *   Example: `my_variable="New Value"`
*   **Unsetting**: Remove from memory using `unset`.
    *   Example: `unset my_variable`

## Slide 5: Environment Variables
*   **Definition**: Special shell variables inherited by child processes.
*   **Purpose**: Configure environment for applications and OS.
*   **Exporting**: Use `export` command to make a shell variable an environment variable [1].
    *   Example: `export MY_ENV_VAR="value"`

## Slide 6: Common Environment Variables [1]
*   **`PATH`**: Directories where shell looks for executables.
    *   Example: `echo $PATH`
*   **`HOME`**: User's home directory.
*   **`USER`**: Current user's username.
*   **`PS1`**: Primary prompt string (what you see before typing commands).
*   **`PS2`**: Secondary prompt string (for multi-line commands).

## Slide 7: Conclusion
*   Shell variables are local to a session.
*   Environment variables are inherited by child processes, made global with `export`.
*   Understanding these is key for managing script data and environment.
*   Next: Special Parameters.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ubuntu/upload/bash.bash.txt)
