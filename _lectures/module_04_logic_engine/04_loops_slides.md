# Module 4.4: Loops: for, while, until, select - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Loops: for, while, until, select
*   **Subtitle**: Repeating Actions in Bash Scripts
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 4.4

## Slide 2: Introduction
*   Loops are essential for automating repetitive tasks.
*   Execute a block of code multiple times.
*   Bash provides several types of loops, each suited for different scenarios.

## Slide 3: `for` Loop (List Iteration)
*   Iterates over a list of items (words, filenames, numbers).
*   **Syntax**:
    ```bash
    for variable in list;
    do
        commands
    done
    ```
*   **Example**: `for file in *.txt; do echo "Processing $file"; done`

## Slide 4: `for` Loop (C-style)
*   Bash also supports a C-style `for` loop for numerical iteration.
*   **Syntax**:
    ```bash
    for (( initialisation; condition; increment ));
    do
        commands
    done
    ```
*   **Example**: `for (( i=1; i<=5; i++ )); do echo "Count: $i"; done`

## Slide 5: `while` Loop
*   Executes commands as long as a condition is true (command returns exit status 0).
*   **Syntax**:
    ```bash
    while command;
    do
        commands
    done
    ```
*   **Example**: `COUNT=0; while (( COUNT < 5 )); do echo "Count: $COUNT"; (( COUNT++ )); done`

## Slide 6: `until` Loop
*   Executes commands as long as a condition is false (command returns non-zero exit status).
*   Opposite of `while` loop.
*   **Syntax**:
    ```bash
    until command;
    do
        commands
    done
    ```
*   **Example**: `COUNT=5; until (( COUNT == 0 )); do echo "Count: $COUNT"; (( COUNT-- )); done`

## Slide 7: `select` Loop (Menu Generation)
*   Creates a simple numbered menu from a list of words.
*   Prompts user for choice, sets `REPLY` variable.
*   **Syntax**:
    ```bash
    select variable in list;
    do
        commands
    done
    ```
*   **Example**: `select fruit in Apple Banana Orange; do echo "You chose $fruit"; break; done`

## Slide 8: Loop Control: `break` and `continue`
*   **`break`**: Exits the loop entirely.
*   **`continue`**: Skips the rest of the current iteration and proceeds to the next.

## Slide 9: `break` and `continue` Example
```bash
#!/bin/bash

for i in 1 2 3 4 5;
do
    if (( i == 3 )); then
        continue # Skip 3
    fi
    if (( i == 5 )); then
        break # Exit loop at 5
    fi
    echo "Number: $i"
done
```

## Slide 10: Best Practices for Loops
*   **Infinite Loops**: Be careful with `while true` or `while :`.
*   **Quoting**: Always quote variables in lists (`"${array[@]}"`) to prevent word splitting.
*   **Readability**: Use clear variable names and proper indentation.
*   **Efficiency**: Avoid unnecessary operations inside loops, especially with large datasets.

## Slide 11: Conclusion
*   Bash offers `for`, `while`, `until`, and `select` loops for iteration.
*   `for` for iterating over lists or C-style numerical ranges.
*   `while` for repeating as long as a condition is true.
*   `until` for repeating as long as a condition is false.
*   `select` for interactive menu generation.
*   `break` and `continue` for loop control.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
