# Module 4.1: Conditional Expressions - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Conditional Expressions
*   **Subtitle**: Making Decisions in Bash Scripts
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 4.1

## Slide 2: Introduction
*   Conditional expressions allow scripts to make decisions.
*   Execute different code blocks based on conditions.
*   Fundamental for creating dynamic and responsive scripts.
*   Bash provides several ways to evaluate conditions.

## Slide 3: Test Command (`test` or `[ ]`)
*   **`test` command**: Evaluates an expression and returns an exit status (0 for true, 1 for false).
*   **`[ ]`**: A synonym for `test`, but requires a closing `]` and spaces around brackets and operators.
*   **Syntax**: `test expression` or `[ expression ]`

## Slide 4: File Test Operators
*   **`-e file`**: True if file exists.
*   **`-f file`**: True if file is a regular file.
*   **`-d file`**: True if file is a directory.
*   **`-s file`**: True if file has size greater than zero.
*   **`-r file`**: True if file is readable by current user.
*   **`-w file`**: True if file is writable by current user.
*   **`-x file`**: True if file is executable by current user.

## Slide 5: File Test Operators Example
```bash
#!/bin/bash

FILE="/etc/passwd"

if [ -f "$FILE" ]; then
    echo "$FILE is a regular file."
fi

if [ -d "/tmp" ]; then
    echo "/tmp is a directory."
fi
```

## Slide 6: String Test Operators
*   **`string1 = string2`**: True if strings are equal.
*   **`string1 != string2`**: True if strings are not equal.
*   **`-z string`**: True if string is empty (zero length).
*   **`-n string`**: True if string is not empty (non-zero length).

## Slide 7: String Test Operators Example
```bash
#!/bin/bash

NAME="Alice"

if [ "$NAME" = "Alice" ]; then
    echo "Hello, Alice!"
fi

if [ -n "$NAME" ]; then
    echo "Name is not empty."
fi
```

## Slide 8: Integer Test Operators
*   **`-eq`**: Equal to
*   **`-ne`**: Not equal to
*   **`-gt`**: Greater than
*   **`-ge`**: Greater than or equal to
*   **`-lt`**: Less than
*   **`-le`**: Less than or equal to

## Slide 9: Integer Test Operators Example
```bash
#!/bin/bash

NUM1=10
NUM2=5

if [ "$NUM1" -gt "$NUM2" ]; then
    echo "$NUM1 is greater than $NUM2."
fi

if [ "$NUM1" -eq 10 ]; then
    echo "$NUM1 is equal to 10."
fi
```

## Slide 10: Logical Operators for `test` (`[ ]`)
*   **`-a`**: Logical AND (e.g., `[ -f file -a -r file ]`)
*   **`-o`**: Logical OR (e.g., `[ -f file -o -d file ]`)
*   **`!`**: Logical NOT (e.g., `[ ! -f file ]`)

## Slide 11: Double Bracket `[[ ]]` (Bash-specific) [1]
*   **Enhanced conditional expression.**
*   More flexible and powerful than `[ ]`.
*   **No word splitting or globbing** on unquoted variables.
*   Supports **regex matching** (`=~`).
*   Supports **logical operators** `&&` and `||` directly.
*   **Syntax**: `[[ expression ]]`

## Slide 12: `[[ ]]` Example
```bash
#!/bin/bash

FILE="report.txt"
PERMISSION="rw"

if [[ -f "$FILE" && "$PERMISSION" == "rw" ]]; then
    echo "File exists and has read/write permission."
fi

# Regex matching
EMAIL="user@example.com"
if [[ "$EMAIL" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]; then
    echo "Valid email format."
fi
```

## Slide 13: Double Parentheses `(( ))` (Arithmetic Evaluation) [1]
*   **Evaluates arithmetic expressions.**
*   Returns exit status 0 if result is non-zero, 1 if zero.
*   Supports C-style arithmetic operators.
*   **Syntax**: `(( expression ))`

## Slide 14: `(( ))` Example
```bash
#!/bin/bash

COUNT=5

if (( COUNT > 0 && COUNT < 10 )); then
    echo "Count is between 1 and 9."
fi

(( COUNT++ ))
echo "New count: $COUNT"
```

## Slide 15: Conclusion
*   Bash offers `test` (`[ ]`), `[[ ]]`, and `(( ))` for conditional logic.
*   `[ ]` for basic file, string, and integer tests.
*   `[[ ]]` for advanced features like regex and logical operators.
*   `(( ))` for arithmetic comparisons.
*   Next: `if/elif/else` Statements.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
