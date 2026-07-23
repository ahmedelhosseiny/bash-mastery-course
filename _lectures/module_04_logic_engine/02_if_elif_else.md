# Module 4.2: `if`/`elif`/`else` Statements

## Introduction

The `if`/`elif`/`else` construct is a fundamental control flow mechanism in Bash scripting, allowing your scripts to execute different blocks of code based on the outcome of conditional expressions. This enables decision-making within your scripts, making them more dynamic and responsive to various situations.

## Basic `if` Statement

The simplest form of a conditional statement is the `if` statement. It executes a block of commands only if a given condition is true.

### Syntax

```bash
if condition
then
    # Commands to execute if condition is true
fi
```

*   `condition`: This is typically a conditional expression (e.g., using `[ ]` or `[[ ]]`) or any command that returns an exit status. An exit status of `0` is considered true, and any non-zero status is considered false.
*   `then`: Marks the beginning of the block of commands to be executed if the condition is true.
*   `fi`: Marks the end of the `if` statement (it's `if` spelled backward).

### Example

```bash
#!/bin/bash

FILE_NAME="my_file.txt"

if [ -f "$FILE_NAME" ]
then
    echo "File '$FILE_NAME' exists."
fi

# Example with a command as condition
if grep -q "error" /var/log/syslog
then
    echo "Errors found in syslog."
fi
```

## `if`/`else` Statement

The `if`/`else` statement allows you to specify an alternative block of code to execute if the initial condition is false.

### Syntax

```bash
if condition
then
    # Commands to execute if condition is true
else
    # Commands to execute if condition is false
fi
```

### Example

```bash
#!/bin/bash

USER_INPUT=""
read -p "Enter something: " USER_INPUT

if [ -z "$USER_INPUT" ]
then
    echo "You didn't enter anything."
else
    echo "You entered: '$USER_INPUT'."
fi
```

## `if`/`elif`/`else` Statement

For situations requiring multiple conditions, the `if`/`elif`/`else` (else if) statement is used. It checks conditions sequentially, executing the first block whose condition evaluates to true.

### Syntax

```bash
if condition1
then
    # Commands to execute if condition1 is true
elif condition2
then
    # Commands to execute if condition2 is true
elif condition3
then
    # Commands to execute if condition3 is true
else
    # Commands to execute if none of the above conditions are true
fi
```

### Example

```bash
#!/bin/bash

SCORE=85

if (( SCORE >= 90 ))
then
    echo "Grade: A"
elif (( SCORE >= 80 ))
then
    echo "Grade: B"
elif (( SCORE >= 70 ))
then
    echo "Grade: C"
else
    echo "Grade: F"
fi
```

## Nested `if` Statements

You can also nest `if` statements within other `if`, `elif`, or `else` blocks. This allows for more complex decision-making logic.

### Example

```bash
#!/bin/bash

AGE=25
CITIZENSHIP="US"

if (( AGE >= 18 ))
then
    echo "Eligible to vote based on age."
    if [ "$CITIZENSHIP" == "US" ]
    then
        echo "Eligible to vote based on citizenship."
        echo "You are eligible to vote."
    else
        echo "Not a US citizen, not eligible to vote."
    fi
else
    echo "Not old enough to vote."
fi
```

While nesting is possible, deeply nested `if` statements can become hard to read and maintain. Consider using logical operators (`&&`, `||`) within `[[ ]]` or `case` statements for simpler alternatives when appropriate.

## Best Practices

*   **Use `[[ ]]` for conditions**: It's generally safer and more powerful than `[ ]` due to its improved parsing and regex capabilities.
*   **Quote variables**: Always double-quote variables within conditional expressions (e.g., `[ -f "$FILE_NAME" ]`) to prevent word splitting and globbing issues, especially with `[ ]`.
*   **Indentation**: Use consistent indentation to improve readability of your `if` statements.
*   **Clear conditions**: Make your conditions as clear and concise as possible.
*   **Consider `case`**: For multiple `elif` branches checking a single variable against different values, a `case` statement might be more readable.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
