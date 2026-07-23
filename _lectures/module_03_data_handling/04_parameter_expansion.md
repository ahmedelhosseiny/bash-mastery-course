# Module 3.4: Parameter Expansion

## Introduction

Parameter expansion is a powerful feature in Bash that allows you to manipulate the values of variables in various ways. It goes beyond simply retrieving a variable's value, enabling you to set default values, remove substrings, replace patterns, and much more. This is crucial for writing flexible and robust scripts.

## Basic Parameter Expansion

The most basic form of parameter expansion is `${parameter}`, which simply expands to the value of the `parameter`. This is generally preferred over `$parameter` to avoid ambiguity, especially when concatenating with other strings.

```bash
NAME="Alice"
echo "Hello, ${NAME}!"

# Compare with:
echo "Hello, $NAME_World!" # Bash looks for variable NAME_World
echo "Hello, ${NAME}_World!" # Bash looks for variable NAME, then appends _World
```

## Parameter Expansion with Default Values

These expansions are useful for providing default values if a parameter is unset or null.

*   **`${parameter:-word}`**: If `parameter` is unset or null, the expansion of `word` is substituted. Otherwise, the value of `parameter` is substituted. The value of `parameter` is **not** changed.

    ```bash
    # Example 1: Parameter is unset
    unset USERNAME
    echo "Hello, ${USERNAME:-Guest}!"
    # Output: Hello, Guest!
    echo "USERNAME is still: $USERNAME" # USERNAME is still unset

    # Example 2: Parameter is set
    USERNAME="Bob"
    echo "Hello, ${USERNAME:-Guest}!"
    # Output: Hello, Bob!
    ```

*   **`${parameter:=word}`**: If `parameter` is unset or null, `word` is assigned to `parameter` and then substituted. Otherwise, the value of `parameter` is substituted. The value of `parameter` **is** changed if it was unset or null.

    ```bash
    unset USERNAME
    echo "Hello, ${USERNAME:=Guest}!"
    # Output: Hello, Guest!
    echo "USERNAME is now: $USERNAME" # USERNAME is now "Guest"

    USERNAME="Charlie"
    echo "Hello, ${USERNAME:=Guest}!"
    # Output: Hello, Charlie!
    echo "USERNAME is still: $USERNAME" # USERNAME is still "Charlie"
    ```

## Parameter Expansion with Error/Alternative Messages

These expansions are used for error handling or providing alternative output.

*   **`${parameter:?word}`**: If `parameter` is unset or null, `word` is written to standard error and the shell exits (if not interactive). Otherwise, the value of `parameter` is substituted. This is useful for mandatory parameters.

    ```bash
    unset FILENAME
    # FILENAME is unset, script would exit with error message:
    # bash: FILENAME: Filename not provided!
    # echo "Processing file: ${FILENAME:?Filename not provided!}"

    FILENAME="report.txt"
    echo "Processing file: ${FILENAME:?Filename not provided!}"
    # Output: Processing file: report.txt
    ```

*   **`${parameter:+word}`**: If `parameter` is unset or null, nothing is substituted. Otherwise, the expansion of `word` is substituted. The value of `parameter` is **not** changed.

    ```bash
    unset DEBUG_MODE
    echo "Debug status: ${DEBUG_MODE:+Enabled}"
    # Output: Debug status: (empty line)

    DEBUG_MODE=true
    echo "Debug status: ${DEBUG_MODE:+Enabled}"
    # Output: Debug status: Enabled
    ```

## Parameter Expansion for Substring Removal

These expansions allow you to remove parts of a string based on a pattern.

*   **`${parameter#word}`**: Remove the shortest matching prefix pattern `word` from `parameter`.
*   **`${parameter##word}`**: Remove the longest matching prefix pattern `word` from `parameter`.

    ```bash
    FILE="/home/user/documents/report.txt"
    echo "Shortest prefix removal: ${FILE#*/}" # Output: home/user/documents/report.txt
    echo "Longest prefix removal: ${FILE##*/}"  # Output: report.txt
    ```

*   **`${parameter%word}`**: Remove the shortest matching suffix pattern `word` from `parameter`.
*   **`${parameter%%word}`**: Remove the longest matching suffix pattern `word` from `parameter`.

    ```bash
    FILE="archive.tar.gz"
    echo "Shortest suffix removal: ${FILE%.*}" # Output: archive.tar
    echo "Longest suffix removal: ${FILE%%.*}"  # Output: archive
    ```

## Parameter Expansion for String Replacement

These expansions allow you to replace parts of a string.

*   **`${parameter/pattern/string}`**: Replace the first match of `pattern` with `string`.
*   **`${parameter//pattern/string}`**: Replace all matches of `pattern` with `string`.

    ```bash
    TEXT="Hello World, Hello Bash"
    echo "First replacement: ${TEXT/Hello/Hi}"
    # Output: Hi World, Hello Bash

    echo "All replacements: ${TEXT//Hello/Hi}"
    # Output: Hi World, Hi Bash
    ```

*   **`${parameter/#pattern/string}`**: If `pattern` matches the beginning of `parameter`, replace it with `string`.
*   **`${parameter/%pattern/string}`**: If `pattern` matches the end of `parameter`, replace it with `string`.

    ```bash
    FILE="document.txt"
    echo "Prefix replacement: ${FILE/#doc/report}"
    # Output: reportument.txt

    echo "Suffix replacement: ${FILE/%txt/pdf}"
    # Output: document.pdf
    ```

## Parameter Expansion for Case Modification

These expansions change the case of characters in a string.

*   **`${parameter^pattern}`**: Convert the first character of `parameter` to uppercase if it matches `pattern`.
*   **`${parameter^^pattern}`**: Convert all characters of `parameter` to uppercase if they match `pattern`.

    ```bash
    WORD="hello world"
    echo "First char uppercase: ${WORD^}" # Output: Hello world
    echo "All chars uppercase: ${WORD^^}"  # Output: HELLO WORLD
    ```

*   **`${parameter,pattern}`**: Convert the first character of `parameter` to lowercase if it matches `pattern`.
*   **`${parameter,,pattern}`**: Convert all characters of `parameter` to lowercase if they match `pattern`.

    ```bash
    WORD="HELLO WORLD"
    echo "First char lowercase: ${WORD,}" # Output: hELLO WORLD
    echo "All chars lowercase: ${WORD,,}"  # Output: hello world
    ```

## Parameter Length

*   **`${#parameter}`**: Expands to the length in characters of the value of `parameter`.

    ```bash
    TEXT="Bash Scripting"
    echo "Length of text: ${#TEXT}"
    # Output: Length of text: 14
    ```

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
