# Module 1.2: Basic Command Line Navigation and File Management - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Basic Command Line Navigation and File Management
*   **Subtitle**: Mastering Your Linux Filesystem
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 1.2

## Slide 2: Introduction to Command Line Interface (CLI)
*   **CLI vs. GUI**
    *   **CLI**: Text-based interface, commands typed
    *   **GUI**: Visual elements, point-and-click
*   Bash is the primary shell for CLI interaction in Linux.

## Slide 3: Navigating the Filesystem: `pwd` and `ls`
*   **`pwd` (Print Working Directory)**
    *   Displays absolute path of current directory.
    *   Example: `pwd`
*   **`ls` (List Directory Contents)**
    *   Lists files and directories.
    *   Common options:
        *   `ls`: Current directory contents
        *   `ls -l`: Long listing format (permissions, owner, size, date)
        *   `ls -a`: Show all files (including hidden)
        *   `ls -lh`: Long listing, human-readable sizes

## Slide 4: Navigating the Filesystem: `cd`
*   **`cd` (Change Directory)**
    *   Moves between directories.
    *   Examples:
        *   `cd /path/to/directory`: Absolute path
        *   `cd directory_name`: Subdirectory
        *   `cd ..`: Parent directory
        *   `cd ~`: Home directory
        *   `cd -`: Previous directory

## Slide 5: File and Directory Management: `mkdir` and `rmdir`
*   **`mkdir` (Make Directory)**
    *   Creates new directories.
    *   `mkdir new_directory`
    *   `mkdir -p parent/child/grandchild`: Creates parent directories if needed.
*   **`rmdir` (Remove Directory)**
    *   Removes *empty* directories.
    *   `rmdir directory_name`
    *   Fails if directory is not empty.

## Slide 6: File and Directory Management: `cp`
*   **`cp` (Copy Files and Directories)**
    *   `cp source_file destination_file`: Copies a file.
    *   `cp source_file directory/`: Copies file into directory.
    *   `cp -r source_directory destination_directory`: Recursively copies directory contents.

## Slide 7: File and Directory Management: `mv`
*   **`mv` (Move/Rename Files and Directories)**
    *   `mv old_name new_name`: Renames a file or directory.
    *   `mv file directory/`: Moves file into directory.

## Slide 8: File and Directory Management: `rm`
*   **`rm` (Remove Files and Directories)**
    *   **Use with caution!** Deleted files are often unrecoverable.
    *   `rm file.txt`: Removes a file.
    *   `rm -r directory/`: Recursively removes directory and contents.
    *   `rm -f file.txt`: Forces removal (no prompt).
    *   `rm -rf directory/`: **Extremely dangerous** (forces recursive removal).

## Slide 9: Absolute vs. Relative Paths
*   **Absolute Path**
    *   Starts from root directory (`/`).
    *   Full path from the top of the filesystem.
    *   Example: `/home/username/documents/report.txt`
*   **Relative Path**
    *   Relative to current working directory.
    *   `.`: Current directory
    *   `..`: Parent directory
    *   Example: `documents/report.txt` (if in `/home/username/`)

## Slide 10: Wildcards (`*`, `?`, `[]`)
*   **Wildcards**: Match multiple filenames with patterns.
    *   **`*`**: Matches zero or more characters.
        *   Example: `*.txt` (all `.txt` files)
    *   **`?`**: Matches exactly one character.
        *   Example: `file?.txt` (`file1.txt`, `fileA.txt`)
    *   **`[]`**: Matches any single character within brackets.
        *   Example: `file[12].txt` (`file1.txt` or `file2.txt`)
        *   Example: `file[a-z].txt`

## Slide 11: Conclusion
*   Mastering CLI navigation and file management is foundational.
*   Commands: `pwd`, `ls`, `cd`, `mkdir`, `rmdir`, `cp`, `mv`, `rm`.
*   Understand absolute/relative paths and wildcards.
*   Next: Viewing and Manipulating Text Files.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
