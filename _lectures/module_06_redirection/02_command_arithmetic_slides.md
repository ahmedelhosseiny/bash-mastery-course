# Module 6.2: Command Substitution and Arithmetic Expansion - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Command Substitution and Arithmetic Expansion
*   **Subtitle**: Dynamic Command Generation and Calculations
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 6.2

## Slide 2: Introduction
*   Dynamically generate parts of commands.
*   Perform mathematical calculations directly in Bash.
*   Makes scripts flexible and responsive.

## Slide 3: Command Substitution
*   Execute a command and use its stdout as part of another command.
*   Two syntaxes: backticks (`` `command` ``) and dollar-parentheses (`$(command)`).

## Slide 4: Backticks (`` `command` ``) [1]
*   Older, POSIX-compliant syntax.
*   Example: `CURRENT_DATE=`date``
*   **Limitations**: Difficult to nest, quoting issues.

## Slide 5: Dollar-Parentheses (`$(command)`) [1]
*   Modern, preferred syntax.
*   Easily nested, more readable.
*   Example: `CURRENT_DATE=$(date)`
*   **Best Practice**: Always use `$(command)`.

## Slide 6: Arithmetic Expansion
*   Perform integer arithmetic directly in Bash.
*   Syntax: `((expression))` or `$((expression))` [1].

## Slide 7: `((expression))`
*   Evaluates arithmetic expression.
*   Exit status: `0` for non-zero result, `1` for zero result.
*   Useful for conditional checks.
*   Example: `if (( 5 > 3 )); then echo "True"; fi`

## Slide 8: `$((expression))`
*   Evaluates expression and substitutes its numerical result.
*   Example: `result=$(( 10 + 5 ))`
*   Supports `+`, `-`, `*`, `/`, `%`, `**`, `++`, `--`.

## Slide 9: Arithmetic Expansion Features
*   **Integer Arithmetic**: Standard operations.
*   **Variables**: No `$` prefix needed inside `(( ))`.
*   **Increment/Decrement**: `++`, `--`.
*   **Bitwise Operations**: `&`, `|`, `^`, `~`, `<<`, `>>`.
*   **Logical Operations**: `&&`, `||`, `!`.

## Slide 10: Floating-Point Arithmetic
*   Bash arithmetic is integer-only.
*   Use external utilities like `bc` or `awk` for floating-point.
*   Example with `bc`: `FLOAT_SUM=$(echo "10.5 + 2.5" | bc)`

## Slide 11: Conclusion
*   Command substitution (`$(command)`) for dynamic command generation.
*   Arithmetic expansion (`$((expression))`) for integer calculations.
*   Use `bc` or `awk` for floating-point arithmetic.
*   Next: Job Control.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
