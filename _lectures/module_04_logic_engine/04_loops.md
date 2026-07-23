# Module 4.4: Loops: `for`, `while`, `until`, `select`

## Introduction

Loops are essential control flow structures that allow you to execute a block of commands repeatedly. Bash provides several types of loops, each suited for different scenarios: `for` loops for iterating over lists, `while` and `until` loops for repeating commands based on a condition, and `select` loops for creating interactive menus.

## 1. `for` Loop

The `for` loop is used to iterate over a list of items, executing a block of commands for each item in the list.

### Syntax (List Iteration)

```bash
for variable in list
do
    # Commands to execute for each item
done
```

*   `variable`: A temporary variable that takes on the value of each item in the `list` during each iteration.
*   `list`: A space-separated list of items (e.g., words, filenames, command output).

### Example: Iterating over a list of strings

```bash
#!/bin/bash

FRUITS="apple banana cherry date"

for fruit in $FRUITS
do
    echo "I like $fruit."
done
```

### Syntax (C-style `for` loop)

Bash also supports a C-style `for` loop, which is useful for numerical iterations.

```bash
for (( initialisation; condition; increment ))
do
    # Commands to execute
done
```

### Example: Numerical iteration

```bash
#!/bin/bash

for (( i=1; i<=5; i++ ))
do
    echo "Count: $i"
done
```

### Iterating over command output

```bash
#!/bin/bash

for file in $(ls *.txt)
do
    echo "Processing file: $file"
done
```

## 2. `while` Loop

The `while` loop repeatedly executes a block of commands as long as a given condition remains true.

### Syntax

```bash
while condition
do
    # Commands to execute as long as condition is true
done
```

*   `condition`: A command or conditional expression that returns an exit status. The loop continues as long as the exit status is `0` (true).

### Example: Counting up

```bash
#!/bin/bash

COUNT=1
while [ $COUNT -le 5 ]
do
    echo "Count: $COUNT"
    COUNT=$(( COUNT + 1 ))
done
```

### Example: Reading a file line by line

```bash
#!/bin/bash

while IFS= read -r line
do
    echo "Line: $line"
done < my_file.txt
```

## 3. `until` Loop

The `until` loop is similar to the `while` loop, but it executes a block of commands as long as a given condition remains false. The loop terminates when the condition becomes true.

### Syntax

```bash
until condition
do
    # Commands to execute as long as condition is false
done
```

*   `condition`: A command or conditional expression that returns an exit status. The loop continues as long as the exit status is non-zero (false).

### Example: Waiting for a file

```bash
#!/bin/bash

FILE="/tmp/ready_file.txt"

until [ -f "$FILE" ]
do
    echo "Waiting for $FILE to appear..."
    sleep 2
done
echo "$FILE found! Proceeding."
```

## 4. `select` Loop

The `select` loop provides a simple way to create interactive menus in Bash scripts. It presents a numbered list of options to the user and waits for input.

### Syntax

```bash
select variable in list
do
    # Commands to execute based on user selection
done
```

*   `variable`: Stores the selected item from the `list`.
*   `list`: A space-separated list of items to be presented as menu options.

### Example: Simple menu

```bash
#!/bin/bash

options=("Apple" "Banana" "Cherry" "Exit")

select fruit in "${options[@]}"
do
    case $fruit in
        "Apple")
            echo "You chose Apple."
            ;;
        "Banana")
            echo "You chose Banana."
            ;;
        "Cherry")
            echo "You chose Cherry."
            ;;
        "Exit")
            echo "Exiting menu."
            break
            ;;
        *)
            echo "Invalid option $REPLY"
            ;;
    esac
done
```

*   `REPLY`: A special variable that holds the number corresponding to the user's selection.

## `break` and `continue` Statements

These statements provide control over loop execution:

*   **`break`**: Exits the current loop entirely. Execution continues with the command immediately following the `done` keyword.
*   **`continue`**: Skips the rest of the current iteration of the loop and proceeds to the next iteration.

### Example: `break` and `continue`

```bash
#!/bin/bash

for i in 1 2 3 4 5 6 7 8 9 10
do
    if (( i % 2 != 0 )); then
        continue # Skip odd numbers
    fi

    echo "Even number: $i"

    if (( i >= 6 )); then
        break # Exit loop if number is 6 or greater
    fi
done
```

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
