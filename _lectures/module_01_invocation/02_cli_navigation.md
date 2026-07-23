# Module 1.2: Basic Command Line Navigation and File Management

## Introduction to Command Line Interface (CLI)

The Command Line Interface (CLI) is a text-based interface used to operate software and operating systems. Unlike a Graphical User Interface (GUI), where you interact with visual elements, the CLI requires you to type commands. Bash is the most common shell used in Linux for interacting with the CLI.

## Navigating the Filesystem

Understanding how to move around the filesystem is fundamental to using the CLI effectively.

### `pwd`: Print Working Directory

The `pwd` command displays the absolute path of your current working directory. This is useful for knowing exactly where you are in the filesystem hierarchy.

```bash
pwd
```

### `ls`: List Directory Contents

The `ls` command lists the contents of a directory. By default, it lists the contents of the current directory.

*   `ls`: Lists files and directories in the current directory.
*   `ls -l`: Provides a long listing format, showing permissions, ownership, size, and modification date.
*   `ls -a`: Shows all files, including hidden files (those starting with a dot).
*   `ls -lh`: Combines long listing with human-readable file sizes.

```bash
ls
ls -l
ls -a
ls -lh
```

### `cd`: Change Directory

The `cd` command is used to change your current working directory.

*   `cd /path/to/directory`: Changes to an absolute path.
*   `cd directory_name`: Changes to a subdirectory within the current directory.
*   `cd ..`: Moves up one level in the directory hierarchy.
*   `cd ~`: Changes to your home directory (shorthand for `cd /home/username`).
*   `cd -`: Changes to the previous working directory.

```bash
pwd
cd /tmp
pwd
cd ~
pwd
cd -
pwd
```

## File and Directory Management

Once you can navigate, the next step is to manage files and directories.

### `mkdir`: Make Directory

The `mkdir` command creates new directories.

*   `mkdir new_directory`: Creates a single new directory.
*   `mkdir -p parent/child/grandchild`: Creates a directory and any necessary parent directories.

```bash
mkdir my_new_dir
mkdir -p projects/bash_course/module1
```

### `rmdir`: Remove Directory

The `rmdir` command removes empty directories. It will fail if the directory contains any files or subdirectories.

```bash
rmdir my_new_dir
```

### `cp`: Copy Files and Directories

The `cp` command copies files and directories.

*   `cp source_file destination_file`: Copies a file.
*   `cp source_file directory/`: Copies a file into a directory.
*   `cp -r source_directory destination_directory`: Recursively copies a directory and its contents.

```bash
touch file1.txt
cp file1.txt file2.txt
mkdir backup
cp file1.txt backup/
cp -r projects/bash_course/ backup_course/
```

### `mv`: Move/Rename Files and Directories

The `mv` command moves or renames files and directories.

*   `mv old_name new_name`: Renames a file or directory.
*   `mv file directory/`: Moves a file into a directory.

```bash
mv file2.txt renamed_file.txt
mv renamed_file.txt backup/
```

### `rm`: Remove Files and Directories

The `rm` command removes files and directories. Use with caution, as deleted files are typically not recoverable from the command line.

*   `rm file.txt`: Removes a file.
*   `rm -r directory/`: Recursively removes a directory and its contents.
*   `rm -f file.txt`: Forces removal without prompting.
*   `rm -rf directory/`: Forces recursive removal (extremely dangerous, use with extreme care).

```bash
rm backup/file1.txt
rm -r backup_course/
```

## Absolute vs. Relative Paths

Understanding paths is crucial for specifying file and directory locations.

*   **Absolute Path**: Starts from the root directory (`/`) and specifies the complete path to a file or directory. Example: `/home/username/documents/report.txt`.
*   **Relative Path**: Specifies the path relative to your current working directory. Example: If you are in `/home/username/`, `documents/report.txt` refers to the same file.

Special relative path notations:

*   `.`: Represents the current directory.
*   `..`: Represents the parent directory.

```bash
pwd
# If pwd is /home/ubuntu
ls ./documents
cd ../
pwd
```

## Wildcards (`*`, `?`, `[]`)

Wildcards are special characters that allow you to match multiple filenames with a single pattern.

*   `*`: Matches zero or more characters. Example: `*.txt` matches all files ending with `.txt`.
*   `?`: Matches exactly one character. Example: `file?.txt` matches `file1.txt`, `fileA.txt`, etc.
*   `[]`: Matches any single character within the brackets. Example: `file[12].txt` matches `file1.txt` or `file2.txt`. `file[a-z].txt` matches `filea.txt` through `filez.txt`.

```bash
touch report1.txt report2.doc image.png
ls *.txt
ls report?.txt
ls report[1-9].txt
```

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
