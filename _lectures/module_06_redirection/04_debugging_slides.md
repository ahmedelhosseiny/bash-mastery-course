# Module 6.4: Debugging Bash Scripts - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Debugging Bash Scripts
*   **Subtitle**: Identifying and Fixing Issues in Your Code
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 6.4

## Slide 2: Introduction
*   Debugging is an inevitable part of scripting.
*   Bash provides built-in mechanisms and practices to find and fix errors.
*   Essential for robust and reliable scripts.

## Slide 3: Common Types of Script Errors
*   **Syntax Errors**: Grammar mistakes (e.g., missing `fi`).
*   **Logic Errors**: Script runs but produces incorrect output/behavior.
*   **Runtime Errors**: Occur during execution (e.g., command not found).
*   **Variable Expansion Issues**: Incorrect quoting, unset variables.

## Slide 4: Essential Debugging Options (`set` command) [1]
*   **`set -x`**: Trace command execution.
    *   Prints commands and arguments to stderr, prefixed by `+ `.
    *   Enable: `set -x` or `bash -x script.sh`.
    *   Disable: `set +x`.

## Slide 5: `set -v`: Verbose Mode
*   Prints shell input lines as they are read.
*   Useful for seeing how Bash interprets the script line by line.
*   Enable: `set -v` or `bash -v script.sh`.
*   Disable: `set +v`.

## Slide 6: `set -e`: Exit on Error
*   Exits immediately if a command exits with a non-zero status.
*   Prevents script from continuing after an error.
*   Enable: `set -e`.
*   Disable: `set +e`.

## Slide 7: `set -u` (or `set -o nounset`): Treat Unset Variables as Error
*   Exits if an unset variable is used (except for specific expansions).
*   Helps catch typos and uninitialized variables.
*   Enable: `set -u`.
*   Disable: `set +u`.

## Slide 8: `set -o pipefail`: Fail on Piped Command Failure
*   Ensures pipeline exit status reflects any command failure, not just the last one.
*   Enable: `set -o pipefail`.
*   Disable: `set +o pipefail`.

## Slide 9: Using `echo` for Debugging
*   Simplest and often most effective.
*   Insert `echo` statements to print variable values, execution flow, or messages.
*   Example: `echo "DEBUG: Variable VAR is: $VAR"`

## Slide 10: Bash Debugger (Advanced Topic)
*   Tools like `bashdb` provide advanced debugging features:
    *   Breakpoints.
    *   Step-by-step execution.
    *   Variable inspection.
    *   Call stack.
*   Requires installation (e.g., `sudo apt-get install bashdb`).

## Slide 11: Best Practices for Debugging
*   **Start Simple**: Use `echo`.
*   **Use `set -x`**: For tracing.
*   **Use `set -euo pipefail`**: For robust scripts.
*   **Test Incrementally**: Test small parts.
*   **Reproduce the Bug**: Understand the exact steps.
*   **Divide and Conquer**: Isolate problematic sections.
*   **Check Logs**: Examine system logs.
*   **Consult Man Pages**: For command behavior.

## Slide 12: Conclusion
*   Mastered essential Bash debugging techniques.
*   Understood `set` options (`-x`, `-v`, `-e`, `-u`, `-o pipefail`).
*   Learned practical tips for effective troubleshooting.
*   Next: Useful Built-in Commands (Deep Dive).

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
