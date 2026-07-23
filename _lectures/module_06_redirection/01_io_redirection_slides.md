# Module 6.1: Input/Output Redirection - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Input/Output Redirection
*   **Subtitle**: Controlling Data Flow in Bash
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 6.1

## Slide 2: Introduction
*   Change where commands read input and send output.
*   Default streams: stdin (0), stdout (1), stderr (2).
*   Manipulate these streams for flexible scripts.

## Slide 3: Standard I/O Streams
*   **Standard Input (stdin)**: File descriptor `0` (keyboard).
*   **Standard Output (stdout)**: File descriptor `1` (terminal screen).
*   **Standard Error (stderr)**: File descriptor `2` (terminal screen for errors).

## Slide 4: Output Redirection: `>` and `>>`
*   **`>`**: Redirect stdout to file (overwrite).
    *   Example: `ls -l > file_list.txt`
*   **`>>`**: Redirect stdout to file (append).
    *   Example: `echo "New line" >> log.txt`

## Slide 5: Output Redirection: `2>` and `2>>`
*   **`2>`**: Redirect stderr to file (overwrite).
    *   Example: `ls /nonexistent 2> errors.log`
*   **`2>>`**: Redirect stderr to file (append).
    *   Example: `echo "Error message" 2>> errors.log`

## Slide 6: Output Redirection: `&>` and `&>>`
*   **`&>`**: Redirect both stdout and stderr to file (overwrite).
    *   Example: `command &> all_output.log`
*   **`&>>`**: Redirect both stdout and stderr to file (append).
    *   Example: `command &>> all_output.log`

## Slide 7: Redirecting stderr to stdout
*   Combine stderr with stdout for processing.
*   **`2>&1`**: Redirects file descriptor 2 (stderr) to file descriptor 1 (stdout).
    *   Example: `command > output.txt 2>&1`
    *   Newer Bash syntax: `command &> output.txt`

## Slide 8: Input Redirection: `<`
*   Feed file content as standard input to a command.
*   **`<`**: Redirect stdin from a file.
    *   Example: `wc -l < my_document.txt`

## Slide 9: Here Documents (`<<`) [1]
*   Provide multi-line input directly within the script.
*   Starts with `<<` followed by a delimiter (e.g., `EOF`).
*   Example:
    ```bash
    cat << END_MESSAGE
    This is line 1.
    This is line 2.
    END_MESSAGE
    ```

## Slide 10: Here Strings (`<<<`) [1]
*   Provide a single string as standard input to a command.
*   More concise than here documents for single lines.
*   Example: `wc -w <<< "Hello World"`

## Slide 11: Conclusion
*   Mastered I/O redirection for stdout, stderr, and stdin.
*   Learned to use `>` `>>` `2>` `2>>` `&>` `&>>` `<`.
*   Understood Here Documents and Here Strings.
*   Next: Command Substitution and Arithmetic Expansion.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
