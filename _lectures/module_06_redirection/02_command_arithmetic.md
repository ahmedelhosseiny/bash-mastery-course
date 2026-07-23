# Module 6.2: Command Substitution and Arithmetic Expansion

## Introduction

Command substitution and arithmetic expansion are powerful features in Bash that allow you to dynamically generate parts of your commands or perform mathematical calculations. These mechanisms enable scripts to be more flexible and responsive, incorporating the output of other commands or the results of calculations directly into their execution flow.

## Command Substitution

Command substitution allows you to execute a command and use its standard output as part of another command. Bash provides two syntaxes for command substitution: backticks (`` `command` ``) and dollar-parentheses (`$(command)`).

### Backticks (`` `command` ``) [1]

This is the older, POSIX-compliant syntax for command substitution. The shell executes the command enclosed in backticks and replaces the entire construct with the command's standard output.

```bash
output=`command arguments`
```

**Example:**

```bash
CURRENT_DATE=`date`
echo "Today is: $CURRENT_DATE"

FILE_COUNT=`ls -l | wc -l`
echo "Number of files: $((FILE_COUNT - 1))" # Subtract 1 for total line count including header
```

**Limitations of Backticks:**

*   **Nesting**: Nesting backticks requires escaping the inner backticks with a backslash, which can quickly become unreadable and error-prone.
    ```bash
    # Difficult to read nested backticks
    # echo `echo `date``
    ```
*   **Quoting**: The output of backtick substitution is subject to word splitting and globbing unless explicitly quoted.

### Dollar-Parentheses (`$(command)`) [1]

This is the modern and preferred syntax for command substitution. It offers several advantages over backticks:

*   **Nesting**: It can be easily nested without requiring any escaping.
*   **Readability**: Generally considered more readable due to its clear start and end delimiters.
*   **No special quoting issues**: The output is still subject to word splitting and globbing, but the syntax itself is cleaner.

```bash
output=$(command arguments)
```

**Example:**

```bash
CURRENT_DATE=$(date)
echo "Today is: $CURRENT_DATE"

FILE_COUNT=$(ls -l | wc -l)
echo "Number of files: $((FILE_COUNT - 1))"

# Nested example
INNER_COMMAND=$(echo "Hello")
OUTER_COMMAND=$(echo "$INNER_COMMAND World")
echo "$OUTER_COMMAND"
```

### Best Practice for Command Substitution

Always use `$(command)` for command substitution. It is more robust, easier to read, and supports nesting naturally.

## Arithmetic Expansion

Arithmetic expansion allows you to perform integer arithmetic directly within Bash scripts. The syntax for arithmetic expansion is `((expression))` or `$((expression))` [1].

### Syntax: `((expression))`

When used as a command, `((expression))` evaluates the arithmetic expression. The exit status is `0` if the expression evaluates to a non-zero value, and `1` if it evaluates to zero. This is useful for conditional checks.

```bash
(( 5 > 3 )) # Exit status 0 (true)
(( 5 < 3 )) # Exit status 1 (false)
```

### Syntax: `$((expression))`

When used with a dollar sign, `$((expression))` evaluates the arithmetic expression and substitutes its result. This is used to get the numerical result of a calculation.

```bash
result=$(( 10 + 5 ))
echo "Result: $result" # Output: Result: 15
```

### Features of Arithmetic Expansion

*   **Integer Arithmetic**: Supports standard integer operations: `+`, `-`, `*`, `/`, `%` (modulo), `**` (exponentiation).
*   **Variables**: Variables within the expression do not need to be prefixed with `$`. Bash automatically treats them as numerical values.
*   **Increment/Decrement**: Supports `++` and `--` operators.
*   **Bitwise Operations**: Supports bitwise AND (`&`), OR (`|`), XOR (`^`), NOT (`~`), left shift (`<<`), right shift (`>>`).
*   **Logical Operations**: Supports logical AND (`&&`), OR (`||`), NOT (`!`).

**Example:**

```bash
#!/bin/bash

NUM1=10
NUM2=3

SUM=$(( NUM1 + NUM2 ))
echo "Sum: $SUM"

DIFFERENCE=$(( NUM1 - NUM2 ))
echo "Difference: $DIFFERENCE"

PRODUCT=$(( NUM1 * NUM2 ))
echo "Product: $PRODUCT"

QUOTIENT=$(( NUM1 / NUM2 ))
echo "Quotient (integer division): $QUOTIENT"

REMAINDER=$(( NUM1 % NUM2 ))
echo "Remainder: $REMAINDER"

INCREMENTED=$(( NUM1++ )) # NUM1 is 10, then becomes 11
echo "Incremented (post-increment): $INCREMENTED, NUM1 is now: $NUM1"

DECREMENTED=$(( --NUM1 )) # NUM1 becomes 10, then DECREMENTED is 10
echo "Decremented (pre-decrement): $DECREMENTED, NUM1 is now: $NUM1"

# Conditional check
if (( NUM1 > NUM2 )); then
    echo "NUM1 is greater than NUM2."
fi
```

### Floating-Point Arithmetic

Bash arithmetic expansion only supports integers. For floating-point calculations, you need to use external utilities like `bc` (basic calculator) or `awk`.

**Example with `bc`:**

```bash
#!/bin/bash

FLOAT_NUM1=10.5
FLOAT_NUM2=2.5

# Using bc for floating-point addition
FLOAT_SUM=$(echo "$FLOAT_NUM1 + $FLOAT_NUM2" | bc)
echo "Float Sum: $FLOAT_SUM"

# Using awk for floating-point multiplication
FLOAT_PRODUCT=$(awk "BEGIN { print $FLOAT_NUM1 * $FLOAT_NUM2 }")
echo "Float Product: $FLOAT_PRODUCT"
```

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
