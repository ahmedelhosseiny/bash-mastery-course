# Module 1.3: Viewing and Manipulating Text Files - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Viewing and Manipulating Text Files
*   **Subtitle**: Essential Tools for Text Processing
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 1.3

## Slide 2: Introduction to Text File Handling
*   Text files are ubiquitous in Linux (logs, configs, data).
*   Need efficient tools for inspection, filtering, and transformation.
*   Focus on fundamental command-line utilities.

## Slide 3: Viewing File Contents: `cat` and `less`
*   **`cat` (Concatenate and Display Files)**
    *   Displays entire content of small files.
    *   `cat file.txt`
    *   `cat -n file.txt`: With line numbers.
*   **`less` (View File Contents Interactively)**
    *   For larger files, views one screen at a time.
    *   `less file.txt`
    *   Navigation: `Spacebar` (forward), `b` (backward), `/pattern` (search), `q` (quit).

## Slide 4: Viewing File Contents: `head` and `tail`
*   **`head` (Display Beginning of Files)**
    *   Shows first 10 lines by default.
    *   `head file.txt`
    *   `head -n 5 file.txt`: First 5 lines.
*   **`tail` (Display End of Files)**
    *   Shows last 10 lines by default.
    *   `tail file.txt`
    *   `tail -n 5 file.txt`: Last 5 lines.
    *   `tail -f file.txt`: Follows file as it grows (real-time logs).

## Slide 5: Manipulating Text Files: `grep`
*   **`grep` (Global Regular Expression Print)**
    *   Searches for patterns in files.
    *   `grep "pattern" file.txt`
    *   `grep -i "pattern" file.txt`: Case-insensitive.
    *   `grep -v "pattern" file.txt`: Invert match (lines *not* matching).
    *   `grep -r "pattern" directory/`: Recursive search.
    *   `grep -c "pattern" file.txt`: Count matching lines.

## Slide 6: Manipulating Text Files: `sed`
*   **`sed` (Stream Editor)**
    *   Filters and transforms text.
    *   Often used for find-and-replace.
    *   `sed 's/old/new/' file.txt`: Replace first occurrence.
    *   `sed 's/old/new/g' file.txt`: Replace all occurrences (`g` for global).
    *   `sed -i 's/old/new/g' file.txt`: In-place edit (use with caution).

## Slide 7: Manipulating Text Files: `awk`
*   **`awk` (Pattern Scanning and Processing Language)**
    *   Powerful for structured text (CSV, logs).
    *   Processes line by line, splits into fields.
    *   `awk '{print $1, $3}' file.txt`: Prints first and third fields.
    *   `awk -F':' '{print $1}' /etc/passwd`: Uses `:` as field separator.

## Slide 8: Manipulating Text Files: `sort` and `uniq`
*   **`sort` (Sort Lines of Text Files)**
    *   Sorts lines alphabetically, numerically, or by field.
    *   `sort file.txt`: Alphabetical.
    *   `sort -r file.txt`: Reverse order.
    *   `sort -n file.txt`: Numerical.
    *   `sort -k 2 file.txt`: Sort by second field.
*   **`uniq` (Report or Omit Repeated Lines)**
    *   Filters adjacent duplicate lines (often used after `sort`).
    *   `uniq file.txt`
    *   `uniq -c file.txt`: Counts occurrences.

## Slide 9: Manipulating Text Files: `wc`
*   **`wc` (Word Count)**
    *   Counts lines, words, and characters.
    *   `wc file.txt`: Lines, words, bytes.
    *   `wc -l file.txt`: Lines only.
    *   `wc -w file.txt`: Words only.
    *   `wc -c file.txt`: Bytes only.

## Slide 10: Pipes (`|`) and Command Chaining
*   **Pipes**: Connects `stdout` of one command to `stdin` of another.
*   `command1 | command2 | command3`
*   **Example**: `cat /var/log/syslog | grep "error" | sort | uniq -c`
    *   Displays syslog, filters for "error", sorts, counts unique occurrences.

## Slide 11: Conclusion
*   Mastered essential text processing tools: `cat`, `less`, `head`, `tail`, `grep`, `sed`, `awk`, `sort`, `uniq`, `wc`.
*   Understood the power of pipes for chaining commands.
*   Next: Bash Fundamentals: Commands, Arguments, and Execution.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
