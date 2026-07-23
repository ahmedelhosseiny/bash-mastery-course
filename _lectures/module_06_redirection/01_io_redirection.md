# Module 6.1: Input/Output Redirection

## Introduction

Input/Output (I/O) redirection is a powerful feature in Bash that allows you to change where commands read their input from and where they send their output. By default, commands read from standard input (stdin), write to standard output (stdout), and send error messages to standard error (stderr). Redirection enables you to manipulate these streams, making your scripts more flexible and capable of handling complex data flows.

## Standard I/O Streams

Every command in a Unix-like system typically interacts with three standard I/O streams:

*   **Standard Input (stdin)**: File descriptor `0`. This is where a command expects to receive its input, usually from the keyboard.
*   **Standard Output (stdout)**: File descriptor `1`. This is where a command sends its normal output, usually to the terminal screen.
*   **Standard Error (stderr)**: File descriptor `2`. This is where a command sends its error messages, also usually to the terminal screen.

## Output Redirection

Output redirection allows you to send the output of a command to a file instead of the screen.

### `>`: Redirect stdout to a file (overwrite)

This operator redirects the standard output of a command to a specified file. If the file already exists, its contents will be **overwritten**.

```bash
command > file
```

**Example:**

```bash
ls -l > file_list.txt
echo "This will overwrite file_list.txt" > file_list.txt
```

### `>>`: Redirect stdout to a file (append)

This operator redirects the standard output of a command to a specified file. If the file already exists, the output will be **appended** to the end of the file.

```bash
command >> file
```

**Example:**

```bash
echo "First line" >> log.txt
echo "Second line" >> log.txt
```

### `2>`: Redirect stderr to a file (overwrite)

This operator redirects the standard error of a command to a specified file. If the file already exists, its contents will be **overwritten**.

```bash
command 2> file
```

**Example:**

```bash
ls /nonexistent 2> errors.log
```

### `2>>`: Redirect stderr to a file (append)

This operator redirects the standard error of a command to a specified file. If the file already exists, the error messages will be **appended** to the end of the file.

```bash
command 2>> file
```

### `&>`: Redirect both stdout and stderr to a file (overwrite)

This operator redirects both standard output and standard error to the same file. If the file already exists, its contents will be **overwritten**.

```bash
command &> file
```

**Example:**

```bash
find / -name "*.conf" &> find_results.log
```

### `&>>`: Redirect both stdout and stderr to a file (append)

This operator redirects both standard output and standard error to the same file. If the file already exists, the output will be **appended** to the end of the file.

```bash
command &>> file
```

### Redirecting stderr to stdout

To process error messages with tools that typically work on stdout (like `grep`), you can redirect stderr to stdout using `2>&1`.

```bash
command > file 2>&1
# Or, using the newer Bash syntax:
command &> file
```

**Example:**

```bash
ls /nonexistent file.txt 2>&1 | grep "No such file"
```

## Input Redirection

Input redirection allows you to feed the contents of a file as standard input to a command, instead of typing it manually.

### `<`: Redirect stdin from a file

This operator takes the content of `file` and uses it as the standard input for `command`.

```bash
command < file
```

**Example:**

```bash
wc -l < my_document.txt # Counts lines in my_document.txt
```

## Here Documents (`<<`) [1]

A here document allows you to provide multiple lines of input to a command directly within the script, rather than from a file. It starts with `<<` followed by a delimiter (e.g., `EOF`). All lines following this until the delimiter is encountered on a line by itself are treated as input.

```bash
command << DELIMITER
line 1
line 2
DELIMITER
```

**Example:**

```bash
cat << END_MESSAGE
This is a multi-line message.
It will be printed to standard output.
END_MESSAGE
```

If the delimiter is quoted (e.g., `<< 
