# Module 3.4: Parameter Expansion - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Parameter Expansion
*   **Subtitle**: Advanced Variable Manipulation in Bash
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 3.4

## Slide 2: Introduction
*   Powerful Bash feature to manipulate variable values.
*   Goes beyond simple retrieval.
*   Enables setting defaults, removing substrings, replacing patterns.
*   Crucial for flexible and robust scripts.

## Slide 3: Basic Parameter Expansion
*   `${parameter}`: Expands to the value of the parameter.
*   Preferred over `$parameter` for clarity, especially with concatenation.
*   Example:
    *   `NAME="Alice"`
    *   `echo "Hello, ${NAME}!"`
    *   `echo "Hello, ${NAME}_World!"` (avoids ambiguity)

## Slide 4: Parameter Expansion with Default Values
*   **`${parameter:-word}`**: If `parameter` is unset or null, substitutes `word`. `parameter` is *not* changed.
    *   Example: `echo "Hello, ${USERNAME:-Guest}!"`
*   **`${parameter:=word}`**: If `parameter` is unset or null, assigns `word` to `parameter` and substitutes it. `parameter` *is* changed.
    *   Example: `echo "Hello, ${USERNAME:=Guest}!"`

## Slide 5: Parameter Expansion with Error/Alternative Messages
*   **`${parameter:?word}`**: If `parameter` is unset or null, prints `word` to stderr and exits (if non-interactive). Mandatory parameters.
    *   Example: `echo "Processing: ${FILENAME:?Filename not provided!}"`
*   **`${parameter:+word}`**: If `parameter` is unset or null, substitutes nothing. Otherwise, substitutes `word`. `parameter` is *not* changed.
    *   Example: `echo "Debug status: ${DEBUG_MODE:+Enabled}"`

## Slide 6: Parameter Expansion for Substring Removal
*   **`${parameter#word}`**: Remove shortest matching prefix `word`.
*   **`${parameter##word}`**: Remove longest matching prefix `word`.
    *   Example: `FILE="/home/user/report.txt"`
    *   `echo "${FILE#*/}"` (home/user/report.txt)
    *   `echo "${FILE##*/}"` (report.txt)
*   **`${parameter%word}`**: Remove shortest matching suffix `word`.
*   **`${parameter%%word}`**: Remove longest matching suffix `word`.
    *   Example: `FILE="archive.tar.gz"`
    *   `echo "${FILE%.*}"` (archive.tar)
    *   `echo "${FILE%%.*}"` (archive)

## Slide 7: Parameter Expansion for String Replacement
*   **`${parameter/pattern/string}`**: Replace first match of `pattern` with `string`.
*   **`${parameter//pattern/string}`**: Replace all matches of `pattern` with `string`.
    *   Example: `TEXT="Hello World, Hello Bash"`
    *   `echo "${TEXT/Hello/Hi}"`
    *   `echo "${TEXT//Hello/Hi}"`
*   **`${parameter/#pattern/string}`**: Replace `pattern` at beginning.
*   **`${parameter/%pattern/string}`**: Replace `pattern` at end.

## Slide 8: Parameter Expansion for Case Modification
*   **`${parameter^pattern}`**: Convert first char to uppercase.
*   **`${parameter^^pattern}`**: Convert all chars to uppercase.
    *   Example: `WORD="hello world"`
    *   `echo "${WORD^}"` (Hello world)
    *   `echo "${WORD^^}"` (HELLO WORLD)
*   **`${parameter,pattern}`**: Convert first char to lowercase.
*   **`${parameter,,pattern}`**: Convert all chars to lowercase.
    *   Example: `WORD="HELLO WORLD"`
    *   `echo "${WORD,}"` (hELLO WORLD)
    *   `echo "${WORD,,}"` (hello world)

## Slide 9: Parameter Length
*   **`${#parameter}`**: Expands to the length (in characters) of `parameter`.
    *   Example: `TEXT="Bash Scripting"`
    *   `echo "Length: ${#TEXT}"` (14)

## Slide 10: Conclusion
*   Parameter expansion offers powerful string manipulation.
*   Essential for dynamic script behavior and data processing.
*   Mastering these forms enhances script flexibility and robustness.
*   Next: Flow Control and Conditional Logic.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
