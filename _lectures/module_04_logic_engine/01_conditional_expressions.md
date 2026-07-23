# Module 4.1: Conditional Expressions

## Introduction

Conditional expressions are fundamental to scripting, allowing your Bash scripts to make decisions and execute different blocks of code based on whether certain conditions are true or false. This module will cover the `test` command and its modern equivalents, `[ ]` and `[[ ]]`, along with various types of tests for files, strings, and numbers.

## The `test` Command

The `test` command evaluates an expression and returns an exit status of `0` (true) or `1` (false). It is often used in `if` statements.

```bash
test expression
```

**Example:**

```bash
# Check if a file exists
test -f my_file.txt
echo $?

# Check if two strings are equal
test "hello" = "hello"
echo $?
```

## The `[ ]` (Single Bracket) Operator

The `[ ]` operator is a synonym for the `test` command. It works exactly the same way, but requires a space after `[` and before `]`. It is a built-in command, not an external executable.

```bash
[ expression ]
```

**Example:**

```bash
# Check if a directory exists
if [ -d /tmp ]; then
    echo "/tmp is a directory."
fi
```

## The `[[ ]]` (Double Bracket) Operator

The `[[ ]]` operator is a more advanced and generally preferred conditional expression construct in Bash. It offers several advantages over `[ ]` and `test`:

*   **Word splitting and pathname expansion (globbing) are not performed** on operands within `[[ ]]`. This means you don't need to quote variables as rigorously.
*   **Supports logical operators** like `&&` (AND) and `||` (OR) directly within the expression, avoiding nested `if` statements or complex `test` command chains.
*   **Supports regular expression matching** using the `=~` operator.

```bash
[[ expression ]]
```

**Example:**

```bash
# Check if a file exists AND is readable
if [[ -f my_file.txt && -r my_file.txt ]]; then
    echo "my_file.txt exists and is readable."
fi

# Regular expression matching
FILENAME="report_2023.txt"
if [[ "$FILENAME" =~ ^report_.*\.txt$ ]]; then
    echo "Filename matches report pattern."
fi
```

## File Tests

These operators check attributes of files and directories [1].

| Operator | Description |
| :------- | :---------- |
| `-a FILE` | True if FILE exists. (Deprecated, use `-e`) |
| `-b FILE` | True if FILE exists and is a block special file. |
| `-c FILE` | True if FILE exists and is a character special file. |
| `-d FILE` | True if FILE exists and is a directory. |
| `-e FILE` | True if FILE exists. |
| `-f FILE` | True if FILE exists and is a regular file. |
| `-g FILE` | True if FILE exists and its set-group-ID bit is set. |
| `-h FILE` | True if FILE exists and is a symbolic link. |
| `-k FILE` | True if FILE exists and its sticky bit is set. |
| `-p FILE` | True if FILE exists and is a named pipe (FIFO). |
| `-r FILE` | True if FILE exists and is readable. |
| `-s FILE` | True if FILE exists and has a size greater than zero. |
| `-t FD`   | True if file descriptor FD is open and refers to a terminal. |
| `-u FILE` | True if FILE exists and its set-user-ID bit is set. |
| `-w FILE` | True if FILE exists and is writable. |
| `-x FILE` | True if FILE exists and is executable. |
| `-O FILE` | True if FILE exists and is owned by the effective user ID. |
| `-G FILE` | True if FILE exists and is owned by the effective group ID. |
| `-L FILE` | True if FILE exists and is a symbolic link. (Same as `-h`) |
| `-S FILE` | True if FILE exists and is a socket. |
| `FILE1 -nt FILE2` | True if FILE1 is newer than FILE2 (modification dates). |
| `FILE1 -ot FILE2` | True if FILE1 is older than FILE2. |
| `FILE1 -ef FILE2` | True if FILE1 and FILE2 refer to the same device and inode numbers. |

**Example:**

```bash
if [ -f "/etc/passwd" ]; then
    echo "/etc/passwd is a regular file."
fi

if [ -d "/var/log" ]; then
    echo "/var/log is a directory."
fi
```

## String Tests

These operators compare strings [1].

| Operator | Description |
| :------- | :---------- |
| `STRING` | True if STRING is not empty. |
| `-n STRING` | True if the length of STRING is non-zero. |
| `-z STRING` | True if the length of STRING is zero. |
| `STRING1 = STRING2` | True if the strings are equal. (Use `==` in `[[ ]]` for pattern matching) |
| `STRING1 != STRING2` | True if the strings are not equal. |
| `STRING1 < STRING2` | True if STRING1 sorts before STRING2 lexicographically. |
| `STRING1 > STRING2` | True if STRING1 sorts after STRING2 lexicographically. |

**Example:**

```bash
NAME="Alice"
if [ -n "$NAME" ]; then
    echo "Name is not empty."
fi

if [[ "$NAME" == "Alice" ]]; then
    echo "Name is Alice."
fi
```

## Numeric Tests

These operators compare integers [1].

| Operator | Description |
| :------- | :---------- |
| `ARG1 -eq ARG2` | True if ARG1 is equal to ARG2. |
| `ARG1 -ne ARG2` | True if ARG1 is not equal to ARG2. |
| `ARG1 -gt ARG2` | True if ARG1 is greater than ARG2. |
| `ARG1 -ge ARG2` | True if ARG1 is greater than or equal to ARG2. |
| `ARG1 -lt ARG2` | True if ARG1 is less than ARG2. |
| `ARG1 -le ARG2` | True if ARG1 is less than or equal to ARG2. |

**Example:**

```bash
COUNT=10
if [ "$COUNT" -gt 5 ]; then
    echo "Count is greater than 5."
fi

if (( COUNT <= 10 )); then # Arithmetic evaluation, also works for numeric comparison
    echo "Count is less than or equal to 10."
fi
```

## Logical Operators

When using `test` or `[ ]`, logical operators are typically separate commands or require specific syntax. With `[[ ]]`, they are more intuitive.

| Operator (`test` / `[ ]`) | Operator (`[[ ]]`) | Description |
| :------------------------ | :----------------- | :---------- |
| `-a` (AND)                | `&&`               | Logical AND |
| `-o` (OR)                 | `||`               | Logical OR |
| `!` (NOT)                 | `!`                | Logical NOT |

**Example with `[ ]`:**

```bash
FILE="test.txt"
if [ -f "$FILE" -a -r "$FILE" ]; then
    echo "File exists and is readable."
fi
```

**Example with `[[ ]]` (preferred):**

```bash
FILE="test.txt"
if [[ -f "$FILE" && -r "$FILE" ]]; then
    echo "File exists and is readable."
fi
```

## Arithmetic Evaluation `(( ))`

Bash also provides `(( ))` for arithmetic evaluation and comparison. This is often more convenient for numerical comparisons than `[ ]` or `test`.

```bash
VAR1=10
VAR2=20

if (( VAR1 < VAR2 )); then
    echo "VAR1 is less than VAR2."
fi

if (( VAR1 + VAR2 == 30 )); then
    echo "Sum is 30."
fi
```

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
