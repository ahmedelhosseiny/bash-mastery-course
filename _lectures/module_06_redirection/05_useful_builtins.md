# Module 6.5: Useful Built-in Commands (Deep Dive)

## Introduction

Bash comes with a rich set of built-in commands that are executed directly by the shell, without invoking an external program. These built-ins are often faster and more efficient than their external counterparts and provide functionalities crucial for scripting. This module will delve into some of the most frequently used and powerful Bash built-in commands.

## 1. `getopts`: Parsing Command-Line Options [1]

`getopts` is a powerful built-in command used by shell procedures to parse positional parameters (command-line options and arguments). It is ideal for handling short options (single-character options, often prefixed with a single hyphen, e.g., `-a`, `-b`).

### Syntax

```bash
getopts optstring name [arg ...]
```

*   `optstring`: A string containing the option characters to be recognized. If a character is followed by a colon (`:`), that option is expected to have an argument. For example, `ab:c` means `-a` and `-c` are options without arguments, while `-b` requires an argument.
*   `name`: The name of a shell variable that `getopts` will set to the option character found.
*   `arg ...`: Optional. The arguments to be parsed. If omitted, `getopts` parses the shell's positional parameters.

### Special Variables Used by `getopts`

*   `$name`: Set to the option character found (e.g., `a`, `b`).
*   `OPTARG`: Set to the argument of an option, if the `optstring` specifies that the option takes an argument.
*   `OPTIND`: The index of the next argument to be processed. It is initialized to `1` each time the shell or a shell script is invoked. You typically `shift $((OPTIND-1))` after the `while getopts` loop to remove the processed options from the positional parameters.

### Example

```bash
#!/bin/bash

# Default values
VERBOSE=0
OUTPUT_FILE=""
INPUT_DIR=""

while getopts "vo:i:" opt; do
    case $opt in
        v)
            VERBOSE=1
            echo "Verbose mode enabled."
            ;;
        o)
            OUTPUT_FILE="$OPTARG"
            echo "Output file set to: $OUTPUT_FILE"
            ;;
        i)
            INPUT_DIR="$OPTARG"
            echo "Input directory set to: $INPUT_DIR"
            ;;
        \?)
            echo "Error: Invalid option -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Error: Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# Shift positional parameters past the options
shift $((OPTIND-1))

# Remaining arguments are now accessible via $1, $2, etc.
if [ -n "$1" ]; then
    echo "First non-option argument: $1"
fi

echo "Script finished."
```

## 2. `read`: Reading Input from the User [1]

The `read` built-in command reads a single line from standard input (or a specified file descriptor) and splits it into fields, assigning them to shell variables.

### Syntax

```bash
read [-options] [variable...]
```

### Common Options

*   `-p PROMPT`: Display `PROMPT` before attempting to read any input.
*   `-r`: Raw input. Prevents backslash escapes from being interpreted.
*   `-s`: Silent mode. Do not echo input coming from a terminal.
*   `-t TIMEOUT`: Timeout in seconds. If input is not received within `TIMEOUT` seconds, `read` returns a non-zero status.
*   `-n NCHARS`: Return after reading `NCHARS` characters.

### Example

```bash
#!/bin/bash

read -p "Enter your name: " NAME
echo "Hello, $NAME!"

read -r -p "Enter a path (with spaces): " USER_PATH
echo "You entered: $USER_PATH"

read -s -p "Enter your password: " PASSWORD
echo "\nPassword received."
```

## 3. `printf`: Formatted Output [1]

`printf` provides more control over output formatting than `echo`, similar to the `printf` function in C.

### Syntax

```bash
printf format [argument...]
```

### Format Specifiers

*   `%s`: String
*   `%d`, `%i`: Decimal integer
*   `%f`: Floating-point number
*   `%x`, `%X`: Hexadecimal integer
*   `\n`: Newline
*   `\t`: Tab

### Example

```bash
#!/bin/bash

NAME="Alice"
AGE=30
BALANCE=123.456

printf "Name: %-10s Age: %-5d Balance: %.2f\n" "$NAME" "$AGE" "$BALANCE"
printf "%-10s %-5s %-8s\n" "Item" "Qty" "Price"
printf "%-10s %-5d %-8.2f\n" "Apple" 5 1.25
printf "%-10s %-5d %-8.2f\n" "Banana" 10 0.75
```

## 4. `trap`: Handling Signals [1]

The `trap` built-in command allows you to execute a command when the shell receives a signal. This is crucial for robust scripts that need to perform cleanup actions (e.g., deleting temporary files) before exiting, even if interrupted.

### Syntax

```bash
trap command signal [signal ...]
```

*   `command`: The command to execute when the specified `signal` is received.
*   `signal`: The name or number of the signal (e.g., `INT` for `SIGINT`, `TERM` for `SIGTERM`, `EXIT` for when the shell exits).

### Common Signals

*   `INT` (2): Interrupt (e.g., `Ctrl+C`)
*   `TERM` (15): Termination (default signal sent by `kill`)
*   `HUP` (1): Hangup (e.g., terminal closed)
*   `QUIT` (3): Quit (e.g., `Ctrl+\`) 
*   `EXIT` (0): Special pseudo-signal that is executed when the shell exits, regardless of how it exits.

### Example: Cleanup on Exit

```bash
#!/bin/bash

TEMP_FILE="/tmp/my_temp_file_$$.txt"
touch "$TEMP_FILE"

# Function to clean up temporary files
cleanup () {
    echo "Cleaning up temporary file: $TEMP_FILE"
    rm -f "$TEMP_FILE"
}

# Register the cleanup function to run on EXIT signal
trap cleanup EXIT

echo "Temporary file created: $TEMP_FILE"
echo "Script running... Press Ctrl+C to test cleanup."

# Simulate some work
sleep 10

echo "Script finished normally."
```

## 5. `eval`: Evaluating Arguments as Commands [1]

The `eval` built-in command concatenates its arguments into a single string, then reads and executes that string as a command. It is powerful but also dangerous if used with untrusted input, as it can execute arbitrary code.

### Syntax

```bash
eval [argument...]
```

### Example

```bash
#!/bin/bash

COMMAND_STR="ls -l /tmp"
eval "$COMMAND_STR"

VAR_NAME="MY_DYNAMIC_VAR"
VAR_VALUE="Dynamic Value"

# Dynamically set a variable
eval "$VAR_NAME=\"$VAR_VALUE\""
echo "Value of $MY_DYNAMIC_VAR: ${!MY_DYNAMIC_VAR}"
```

**Caution**: Avoid `eval` with user-supplied input unless you have thoroughly sanitized it, as it can lead to security vulnerabilities.

## 6. `exec`: Replacing the Current Shell [1]

The `exec` built-in command replaces the current shell process with a new command, without creating a new process. This means the new command takes over the current shell's PID and environment. If `command` is not specified, any redirections take effect in the current shell.

### Syntax

```bash
exec [-cl] [-a name] [command [arguments]]
```

### Example

```bash
#!/bin/bash

echo "Current shell PID: $$"

# Replace the current shell with 'ls -l /'
# Note: The script will terminate after 'ls' completes, and no further commands in this script will run.
# exec ls -l /

# Redirect stdout of the current shell to a file
echo "This line will go to output.txt"
exec > output.txt
echo "This line also goes to output.txt"

# The following line will not be seen on the console if stdout was redirected
echo "This line will not be seen on console."
```

## 7. `source` (`.`): Executing Commands in the Current Shell [1]

The `source` command (or its synonym, `.` - a single dot) reads and executes commands from a file in the current shell environment. This is different from executing a script, which typically runs in a subshell.

### Syntax

```bash
source filename [arguments]
. filename [arguments]
```

### Example

Create a file `my_vars.sh`:

```bash
# my_vars.sh
EXPORTED_VAR="I am exported"
MY_FUNCTION () { echo "Hello from MY_FUNCTION!"; }
```

Then in your main script or terminal:

```bash
#!/bin/bash

echo "Before sourcing: EXPORTED_VAR is '$EXPORTED_VAR'"

source my_vars.sh
# Or: . my_vars.sh

echo "After sourcing: EXPORTED_VAR is '$EXPORTED_VAR'"
MY_FUNCTION
```

**Key difference from `bash script.sh`**: When you `source` a script, any variables, functions, or aliases defined in that script become part of the *current* shell environment. When you execute `bash script.sh`, it runs in a *subshell*, and its environment changes do not affect the parent shell.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
