# Module 6.4: Debugging Bash Scripts

## Introduction

Debugging is an inevitable part of writing scripts. Even the most experienced scripters encounter errors. Bash provides several built-in mechanisms and common practices to help you identify and fix issues in your scripts. This module will cover essential debugging techniques, from simple output statements to more advanced tracing options.

## Common Types of Script Errors

Before diving into debugging tools, it's helpful to understand common error categories:

*   **Syntax Errors**: Mistakes in the script's grammar (e.g., missing `fi`, unclosed quotes, incorrect command syntax). Bash usually reports these directly.
*   **Logic Errors**: The script runs without syntax errors but doesn't produce the expected output or behavior. This is often the hardest type of error to find.
*   **Runtime Errors**: Errors that occur during execution, such as a command not found, permission denied, or division by zero.
*   **Variable Expansion Issues**: Incorrect quoting, unset variables, or unexpected word splitting.

## Essential Debugging Options (`set` command) [1]

The `set` command is incredibly powerful for controlling shell behavior and enabling debugging modes.

### `set -x`: Trace Command Execution

This option enables **trace mode**. Before executing each command, Bash prints the command and its expanded arguments to standard error, prefixed by `+ `. This allows you to see exactly what commands Bash is running and with what values.

*   **Enable**: `set -x` or `bash -x your_script.sh`
*   **Disable**: `set +x`

**Example:**

```bash
#!/bin/bash

set -x # Enable tracing

MY_VAR="Hello"
echo "$MY_VAR World"

ls /tmp/nonexistent_dir

set +x # Disable tracing

echo "Tracing is now off."
```

**Output (example):**

```
+ MY_VAR="Hello"
+ echo "Hello World"
Hello World
+ ls /tmp/nonexistent_dir
ls: cannot access '/tmp/nonexistent_dir': No such file or directory
+ set +x
Tracing is now off.
```

### `set -v`: Verbose Mode

This option enables **verbose mode**. Bash prints shell input lines as they are read. This is useful for seeing how the shell interprets your script line by line, especially with complex constructs or nested commands.

*   **Enable**: `set -v` or `bash -v your_script.sh`
*   **Disable**: `set +v`

**Example:**

```bash
#!/bin/bash

set -v # Enable verbose mode

MY_VAR="Hello"
echo "$MY_VAR World"

if [ -f /etc/passwd ]; then
    echo "passwd file exists."
fi

set +v # Disable verbose mode

echo "Verbose mode is now off."
```

**Output (example):**

```
MY_VAR="Hello"
echo "$MY_VAR World"
Hello World
if [ -f /etc/passwd ]; then
    echo "passwd file exists."
fi
passwd file exists.
set +v
Verbose mode is now off.
```

### `set -e`: Exit on Error

This option causes the script to exit immediately if a command exits with a non-zero status (i.e., fails). This prevents the script from continuing with potentially invalid data or state after an error.

*   **Enable**: `set -e`
*   **Disable**: `set +e`

**Example:**

```bash
#!/bin/bash

set -e # Exit on first error

echo "Starting script..."
ls /tmp/nonexistent_dir # This command will fail
echo "This line will not be reached if ls fails."
```

### `set -u` or `set -o nounset`: Treat Unset Variables as Error

This option causes the script to exit if it tries to use an unset variable (except when checking for existence, e.g., `${VAR:-default}`). This helps catch typos and ensures all variables are initialized.

*   **Enable**: `set -u` or `set -o nounset`
*   **Disable**: `set +u` or `set +o nounset`

**Example:**

```bash
#!/bin/bash

set -u # Exit on unset variable

echo "Starting script..."
echo "My name is $NAME" # NAME is unset, script will exit
echo "This line will not be reached."
```

### `set -o pipefail`: Fail on Piped Command Failure

Normally, in a pipeline `cmd1 | cmd2 | cmd3`, the exit status of the pipeline is the exit status of the last command (`cmd3`). If `cmd1` fails but `cmd2` and `cmd3` succeed, the pipeline still reports success. `set -o pipefail` changes this behavior so that the pipeline's exit status is the exit status of the rightmost command that exited with a non-zero status.

*   **Enable**: `set -o pipefail`
*   **Disable**: `set +o pipefail`

**Example:**

```bash
#!/bin/bash

# Without set -o pipefail, this would report success (exit status 0)
# false | true
# echo $?

set -o pipefail

echo "Starting pipeline test..."
false | true
echo "Exit status: $?" # This will now be 1 (from false)
```

## Using `echo` for Debugging

The simplest and often most effective debugging technique is to strategically insert `echo` statements throughout your script to print the values of variables, the flow of execution, or messages at critical points.

**Example:**

```bash
#!/bin/bash

FILE_PATH="/path/to/my/file.txt"

echo "DEBUG: FILE_PATH is set to: $FILE_PATH"

if [ -f "$FILE_PATH" ]; then
    echo "DEBUG: File exists. Proceeding with processing."
    # ... processing logic ...
else
    echo "ERROR: File $FILE_PATH not found. Exiting."
    exit 1
fi
```

## Bash Debugger (Advanced Topic)

For very complex scripts, a dedicated Bash debugger can be invaluable. Tools like `bashdb` provide features similar to debuggers in other programming languages, such as:

*   **Breakpoints**: Pause execution at specific lines.
*   **Step-by-step execution**: Execute the script one line at a time.
*   **Variable inspection**: View and modify variable values during execution.
*   **Call stack**: See the sequence of function calls.

Installing and using `bashdb` typically involves installing the package from your distribution's repository:
*   **Debian/Ubuntu (APT)**: `sudo apt-get install bashdb`
*   **Fedora/RHEL/CentOS (DNF/YUM)**: `sudo dnf install bashdb` (or compile from source if unavailable in repository)
*   **Arch Linux (Pacman)**: `sudo pacman -S bashdb`

Once installed, invoke your script using:
```bash
bashdb your_script.sh
```

## Best Practices for Debugging

*   **Start Simple**: Begin with `echo` statements to narrow down the problem area.
*   **Use `set -x`**: For tracing execution flow and variable expansion.
*   **Use `set -euo pipefail`**: Add these options at the beginning of your scripts to make them more robust and fail early on errors.
*   **Test Incrementally**: Test small parts of your script as you write them.
*   **Reproduce the Bug**: Understand the exact steps to reliably reproduce the error.
*   **Divide and Conquer**: Comment out sections of your script to isolate the problematic part.
*   **Check Logs**: Examine system logs (`/var/log/syslog`, `dmesg`) for related errors.
*   **Consult Man Pages**: When a command behaves unexpectedly, check its `man` page for correct usage and options.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
