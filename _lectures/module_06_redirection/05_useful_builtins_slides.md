# Module 6.5: Useful Built-in Commands (Deep Dive) - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Useful Built-in Commands (Deep Dive)
*   **Subtitle**: Advanced Bash Functionality
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 6.5

## Slide 2: Introduction
*   Bash built-in commands are executed directly by the shell.
*   Faster and more efficient than external programs.
*   Provide crucial functionalities for advanced scripting.

## Slide 3: `getopts`: Parsing Command-Line Options [1]
*   Used by shell procedures to parse short options (e.g., `-a`, `-b`).
*   **Syntax**: `getopts optstring name [arg ...]`
*   `optstring`: Defines valid options and those requiring arguments (e.g., `ab:c`).
*   **Variables**: `OPTARG` (option argument), `OPTIND` (index of next arg).

## Slide 4: `getopts` Example
```bash
while getopts "vo:i:" opt; do
    case $opt in
        v) VERBOSE=1 ;;
        o) OUTPUT_FILE="$OPTARG" ;;
        i) INPUT_DIR="$OPTARG" ;;
        \?) echo "Error: Invalid option" >&2; exit 1 ;;
        :) echo "Error: Option -$OPTARG requires an argument." >&2; exit 1 ;;
    esac
done
shift $((OPTIND-1))
```

## Slide 5: `read`: Reading Input from the User [1]
*   Reads a single line from standard input.
*   Splits into fields, assigns to variables.
*   **Syntax**: `read [-options] [variable...]`
*   **Options**: `-p PROMPT`, `-r` (raw), `-s` (silent), `-t TIMEOUT`, `-n NCHARS`.

## Slide 6: `read` Example
```bash
read -p "Enter your name: " NAME
echo "Hello, $NAME!"
read -s -p "Enter password: " PASSWORD
echo "\nPassword received."
```

## Slide 7: `printf`: Formatted Output [1]
*   More control over output formatting than `echo`.
*   Similar to C `printf`.
*   **Syntax**: `printf format [argument...]`
*   **Format Specifiers**: `%s` (string), `%d` (decimal), `%f` (float), `\n`, `\t`.

## Slide 8: `printf` Example
```bash
NAME="Alice"; AGE=30; BALANCE=123.456
printf "Name: %-10s Age: %-5d Balance: %.2f\n" "$NAME" "$AGE" "$BALANCE"
```

## Slide 9: `trap`: Handling Signals [1]
*   Executes a command when the shell receives a signal.
*   Crucial for cleanup actions (e.g., deleting temp files).
*   **Syntax**: `trap command signal [signal ...]`
*   **Common Signals**: `INT` (Ctrl+C), `TERM`, `HUP`, `EXIT` (on shell exit).

## Slide 10: `trap` Example (Cleanup on Exit)
```bash
TEMP_FILE="/tmp/my_temp_file_$$.txt"
touch "$TEMP_FILE"
cleanup () { rm -f "$TEMP_FILE"; }
trap cleanup EXIT
echo "Temp file created: $TEMP_FILE"
# ... script logic ...
```

## Slide 11: `eval`: Evaluating Arguments as Commands [1]
*   Concatenates arguments, then executes as a command.
*   **Powerful but dangerous** with untrusted input (security risk).
*   **Syntax**: `eval [argument...]`
*   Example: `COMMAND_STR="ls -l /tmp"; eval "$COMMAND_STR"`

## Slide 12: `exec`: Replacing the Current Shell [1]
*   Replaces current shell process with a new command.
*   New command takes over current shell's PID.
*   If no command, redirections take effect in current shell.
*   Example: `exec ls -l /` (script terminates after `ls`)

## Slide 13: `source` (`.`): Executing Commands in the Current Shell [1]
*   Reads and executes commands from a file in the *current* shell environment.
*   Variables/functions defined become part of current shell.
*   **Syntax**: `source filename` or `. filename`
*   **Contrast**: Running a script (`bash script.sh`) executes in a subshell.

## Slide 14: `source` Example
*   `config.sh`: `DB_HOST="localhost"; connect_db () { echo "Connecting..."; }`
*   Main script: `source config.sh; echo $DB_HOST; connect_db`

## Slide 15: Conclusion
*   Mastered advanced Bash built-in commands.
*   `getopts` for option parsing, `read` for input, `printf` for formatting.
*   `trap` for signal handling, `eval` (with caution), `exec` for process replacement, `source` for environment loading.
*   Next: Scripting for System Administration.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
