# Module 4.2: if/elif/else Statements - Presentation Outline

## Slide 1: Title Slide
*   **Title**: if/elif/else Statements
*   **Subtitle**: Implementing Conditional Logic in Bash
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 4.2

## Slide 2: Introduction
*   `if` statements are fundamental for decision-making.
*   Execute code blocks based on the success or failure of a command or expression.
*   Allows scripts to respond dynamically to different conditions.

## Slide 3: Basic `if` Statement
*   Executes a block of code if a condition is true (command returns exit status 0).
*   **Syntax**:
    ```bash
    if command;
    then
        # commands to execute if 'command' succeeds
    fi
    ```
*   `command` can be any command, including `test`, `[ ]`, `[[ ]]`, or `(( ))`.

## Slide 4: `if` Statement Example
```bash
#!/bin/bash

FILE="/tmp/my_file.txt"

if [ -f "$FILE" ]; then
    echo "File $FILE exists."
fi

echo "Script continues..."
```

## Slide 5: `if-else` Statement
*   Executes one block of code if the condition is true, and another if it is false.
*   **Syntax**:
    ```bash
    if command;
    then
        # commands if true
    else
        # commands if false
    fi
    ```

## Slide 6: `if-else` Statement Example
```bash
#!/bin/bash

FILE="/tmp/nonexistent_file.txt"

if [ -f "$FILE" ]; then
    echo "File $FILE exists."
else
    echo "File $FILE does not exist."
fi
```

## Slide 7: `if-elif-else` Statement
*   Allows for multiple conditions to be checked sequentially.
*   **Syntax**:
    ```bash
    if command1;
    then
        # commands if command1 succeeds
    elif command2;
    then
        # commands if command1 fails AND command2 succeeds
    else
        # commands if both command1 and command2 fail
    fi
    ```

## Slide 8: `if-elif-else` Statement Example
```bash
#!/bin/bash

read -p "Enter a number: " NUM

if (( NUM > 0 )); then
    echo "Number is positive."
elif (( NUM < 0 )); then
    echo "Number is negative."
else
    echo "Number is zero."
fi
```

## Slide 9: Nested `if` Statements
*   `if` statements can be nested inside other `if`, `elif`, or `else` blocks.
*   Useful for more complex decision trees.
*   **Caution**: Can become hard to read if too deeply nested.

## Slide 10: Nested `if` Example
```bash
#!/bin/bash

read -p "Enter a number: " NUM

if (( NUM % 2 == 0 )); then
    echo "Number is even."
    if (( NUM > 10 )); then
        echo "And it's greater than 10."
    else
        echo "And it's not greater than 10."
    fi
else
    echo "Number is odd."
fi
```

## Slide 11: Best Practices for `if` Statements
*   **Use `[[ ]]` or `(( ))`**: For most conditional checks, they are safer and more powerful than `[ ]`.
*   **Always quote variables**: Inside `[ ]` or `[[ ]]` to prevent word splitting issues.
*   **Clear indentation**: Improves readability.
*   **Avoid deep nesting**: Consider `case` statements or functions for complex logic.
*   **Error handling**: Use `if` to check command success (`if command; then ... else ... fi`).

## Slide 12: Conclusion
*   `if`, `elif`, and `else` are essential for controlling script flow.
*   Allow for branching logic based on conditions.
*   Proper usage of conditional expressions (`[[ ]]`, `(( ))`) and quoting is key.
*   Next: `case` Statements.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
