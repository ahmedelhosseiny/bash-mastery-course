# Module 1.3: Viewing and Manipulating Text Files

## Introduction to Text Processing in Bash

One of Bash's most powerful capabilities is text processing. In Unix philosophy, "everything is a stream" or "everything is a file", and text is the universal interface. Bash provides an extensive suite of built-in features and external utilities to view, search, and manipulate text data streams.

---

## 1. Viewing Text Files

Before manipulating a file, you must be able to view its contents.

### `cat` (Concatenate)
Used to display the entire contents of a file on standard output.
```bash
cat file.txt
```
*   **Drawback**: It dumps everything at once. For files with thousands of lines, your terminal buffer will overflow, making it impossible to read.

### `less` (Interactive Pager)
An interactive viewer that allows you to page through files screen-by-screen, search, and navigate forward and backward without loading the entire file into memory (highly efficient for large files).
```bash
less large_log_file.log
```
*   **Navigation keys**:
    *   `Spacebar` / `Page Down`: Move down one page.
    *   `b` / `Page Up`: Move up one page.
    *   `g`: Go to the beginning of the file.
    *   `G`: Go to the end of the file.
    *   `/pattern`: Search forward for `pattern`. Press `n` for next occurrence, `N` for previous.
    *   `?pattern`: Search backward for `pattern`.
    *   `q`: Quit the viewer.

### `head` and `tail`
Used to view the beginning or end of a file, respectively.
*   **Default**: Displays 10 lines.
*   **Custom line counts**: Use the `-n` option.
```bash
# View the first 20 lines of a file
head -n 20 data.csv

# View the last 15 lines of a log file
tail -n 15 debug.log
```
*   **Monitoring Live Updates**: The `tail -f` (follow) command is extremely popular in system administration. It remains open and outputs new lines as they are appended to a log file in real-time.
```bash
tail -f /var/log/nginx/access.log
```

---

## 2. Searching Text with `grep`

`grep` (Global Regular Expression Print) searches one or more input files for lines matching a pattern and writes matching lines to standard output.

### Essential `grep` Options:
*   `-i`: Case-insensitive search.
*   `-v`: Invert match (show lines that do *not* match the pattern).
*   `-c`: Count matching lines instead of printing them.
*   `-n`: Show line numbers.
*   `-r` or `-R`: Recursive search through subdirectories.
*   `-E`: Interpret the pattern as an Extended Regular Expression (ERE).

### Examples:
```bash
# Search for 'error' (case-insensitive) in syslog
grep -i "error" /var/log/syslog

# Find all lines NOT containing 'debug'
grep -v "DEBUG" application.log

# Recursively search for 'Samtools' in all files under a source directory
grep -rn "Samtools" ./bioinfo_scripts/
```

---

## 3. Basic Manipulation Utilities

### `sort`
Sorts lines of text files.
*   `-n`: Sort numerically (instead of alphabetically).
*   `-r`: Reverse the sort order (descending).
*   `-t`: Define a field separator (default is whitespace).
*   `-k`: Specify the field (column) to sort on.
```bash
# Sort a file of numbers numerically in descending order
sort -nr numbers.txt

# Sort a tab-separated file based on the second column
sort -t$'	' -k2,2 data.tsv
```

### `uniq`
Filters adjacent matching lines from input, showing unique lines.
*   **Crucial Rule**: `uniq` only detects duplicate lines that are adjacent. You must run `sort` before `uniq` to detect all duplicates.
*   `-c`: Count occurrences of each line.
*   `-d`: Show only duplicate lines.
*   `-u`: Show only unique lines (lines that occurred exactly once).
```bash
# Count how many times each IP address appears in log files
cat access_ips.txt | sort | uniq -c
```

### `wc` (Word Count)
Counts lines, words, and characters/bytes in a stream.
*   `-l`: Count lines.
*   `-w`: Count words.
*   `-c`: Count bytes.
```bash
# Count the number of lines in a file
wc -l genome_assembly.fa
```

---

## 4. The Power of Pipes (`|`)

A pipe (`|`) redirects the standard output of one command into the standard input of another. This allows you to combine simple commands into powerful, complex pipelines.

### Pipeline Example:
Find the top 5 most frequent error messages in a log file:
```bash
grep "ERROR" system.log | cut -d']' -f2- | sort | uniq -c | sort -nr | head -n 5
```
**Explanation**:
1.  `grep "ERROR"`: Filters only lines containing "ERROR".
2.  `cut -d']' -f2-`: Strips out the timestamp prefix (assuming the log format is `[timestamp] message`).
3.  `sort`: Groups identical messages together.
4.  `uniq -c`: Counts occurrences of each unique message.
5.  `sort -nr`: Sorts the count results numerically in descending order.
6.  `head -n 5`: Extracts only the top 5 lines.

---

## References
*   [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt) - Section on Pipelines and Redirections.
