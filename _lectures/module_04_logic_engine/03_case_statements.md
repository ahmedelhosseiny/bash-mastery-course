# Module 4.3: Case Statements

## The Logic of `case` in Bash

The `case` statement is a multi-way branch conditional structure in Bash. It is functionally equivalent to `switch` statements found in other programming languages (like C, Java, or Javascript). It allows you to match a variable or expression against multiple shell patterns (glob-style patterns) and execute corresponding code blocks when a match is found.

`case` statements are typically much cleaner, more readable, and faster than long chains of `if-elif-else` conditions when matching strings or flags.

---

## 1. Syntax of `case`

```bash
case expression in
    pattern1)
        # Commands executed if expression matches pattern1
        ;;
    pattern2 | pattern3)
        # Commands executed if expression matches pattern2 OR pattern3
        ;;
    *)
        # Default fallback case (equivalent to 'default' or 'else')
        ;;
esac
```

### Key Elements:
*   `case` and `in`: The statements that start the block.
*   `)`: Closes a pattern declaration.
*   `|`: The logical OR separator, allowing multiple patterns to trigger the same block.
*   `;;`: The double-semicolon acts as the terminator for a block (preventing execution from leaking into the next pattern).
*   `*`: The wildcard catch-all pattern. It matches anything and serves as the default fallback.
*   `esac` (`case` spelled backwards): Closes the entire block.

---

## 2. Shell Pattern Matching (Globbing)

Unlike conditional expressions (`[[ ]]` or `[ ]`) which can perform complex mathematical and boolean checks, `case` statements match patterns using standard **Shell Globbing** rules. These are the same rules used for pathname expansion:

*   `*`: Matches any string, including an empty string.
*   `?`: Matches any single character.
*   `[...]`: Matches any of the enclosed characters (e.g. `[a-z]`, `[0-9]`, `[yY]`).

### Example: Matching User Input
```bash
read -p "Do you want to proceed? (y/n): " answer

case "$answer" in
    [yY] | [yY][eE][sS])
        echo "Proceeding with installation..."
        ;;
    [nN] | [nN][oO])
        echo "Installation aborted."
        exit 0
        ;;
    *)
        echo "Invalid input. Please answer yes or no." >&2
        exit 1
        ;;
esac
```

---

## 3. Advanced Feature: Fall-through Operators

In Bash 4.0+, two new operators were introduced to allow falling through to subsequent patterns instead of terminating the case block immediately:

### `;&` (Execute Next Block unconditionally)
Forces execution to continue into the command block of the next pattern, ignoring whether that pattern matches.
```bash
case "$1" in
    1)
        echo "First block triggered"
        ;& # Fall through to the next pattern block
    2)
        echo "Second block triggered (either because of match or fall-through)"
        ;;
esac
```

### `;;&` (Test Next Patterns)
Continues testing subsequent patterns in the case block, executing their commands if they also match.
```bash
var="alpha"
case "$var" in
    alp*)
        echo "Matched prefix alp"
        ;;& # Continue testing other patterns
    *pha)
        echo "Matched suffix pha"
        ;;
esac
```

---

## 4. Real-world Use Case: File Extension Processor

A common task in pipeline engineering is checking a file's extension and executing the correct parser tool (e.g., in bioinformatics or file backups).

```bash
#!/bin/bash

FILE_PATH="$1"

if [ -z "$FILE_PATH" ]; then
    echo "Usage: $0 <filename>" >&2
    exit 1
fi

# Extract the extension (using parameter expansion)
EXTENSION="${FILE_PATH##*.}"

case "$EXTENSION" in
    gz | zip)
        echo "Decompressing archive using gunzip/unzip..."
        ;;
    fastq | fq)
        echo "Processing FASTQ DNA sequencing reads..."
        ;;
    fasta | fa)
        echo "Processing FASTA protein/genomic sequence..."
        ;;
    csv | tsv)
        echo "Processing structured text table data..."
        ;;
    *)
        echo "Unknown file extension: $EXTENSION. No processor available." >&2
        exit 1
        ;;
esac
```

---

## References
*   [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt) - Section on Conditional Construction and Compound Commands.
