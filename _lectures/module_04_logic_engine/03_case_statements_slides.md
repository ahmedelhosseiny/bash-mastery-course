# Module 4.3: case Statements - Presentation Outline

## Slide 1: Title Slide
*   **Title**: case Statements
*   **Subtitle**: Multi-way Branching in Bash
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 4.3

## Slide 2: Introduction
*   `case` statements provide a clean way to handle multiple conditional branches.
*   Alternative to long `if-elif-else` chains when comparing a single value against several patterns.
*   Enhances readability and maintainability for specific types of conditional logic.

## Slide 3: Basic `case` Statement Syntax
*   Compares a `word` against a list of `patterns`.
*   Executes commands associated with the first matching pattern.
*   **Syntax**:
    ```bash
    case word in
        pattern1)
            commands1
            ;;
        pattern2)
            commands2
            ;;
        ... 
        patternN)
            commandsN
            ;;
        *)
            default_commands
            ;;
    esac
    ```
*   `word`: The string to be matched.
*   `pattern`: Can include wildcards (`*`, `?`, `[]`).
*   `commands`: One or more commands to execute.
*   `;;`: Terminates a pattern block.
*   `*)`: Catches any non-matching patterns (default case).

## Slide 4: `case` Statement Example
```bash
#!/bin/bash

read -p "Enter a color (red, green, blue): " COLOR

case "$COLOR" in
    red)
        echo "You chose red."
        ;;
    green)
        echo "You chose green."
        ;;
    blue)
        echo "You chose blue."
        ;;
    *)
        echo "Unknown color: $COLOR"
        ;;
esac
```

## Slide 5: Using Wildcards in `case` Patterns
*   Patterns in `case` statements support shell wildcards.
*   `*`: Matches any string.
*   `?`: Matches any single character.
*   `[]`: Matches any character in the set.

## Slide 6: Wildcard Example
```bash
#!/bin/bash

read -p "Enter a filename: " FILENAME

case "$FILENAME" in
    *.txt)
        echo "It's a text file."
        ;;
    *.sh)
        echo "It's a Bash script."
        ;;
    image*.{jpg,png,gif})
        echo "It's an image file starting with 'image'."
        ;;
    *)
        echo "Unknown file type."
        ;;
esac
```

## Slide 7: Multiple Patterns per Case
*   You can specify multiple patterns for a single block of commands.
*   Separate patterns with a pipe (`|`).

## Slide 8: Multiple Patterns Example
```bash
#!/bin/bash

read -p "Enter a day of the week: " DAY

case "$DAY" in
    Mon|Tue|Wed|Thu|Fri)
        echo "It's a weekday."
        ;;
    Sat|Sun)
        echo "It's a weekend day."
        ;;
    *)
        echo "Invalid day: $DAY"
        ;;
esac
```

## Slide 9: `case` vs. `if-elif-else`
*   **`if-elif-else`**: More general, can evaluate complex conditions (e.g., numerical comparisons, multiple variable checks).
*   **`case`**: Best for comparing a single variable against multiple string patterns (especially with wildcards).
*   **Readability**: `case` is often more readable for multi-way branching on a single value.

## Slide 10: Conclusion
*   `case` statements offer a structured way to handle multi-way branching.
*   Ideal for matching a single value against various patterns, including wildcards.
*   Improves script clarity compared to long `if-elif-else` chains.
*   Next: Loops: `for`, `while`, `until`, `select`.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
