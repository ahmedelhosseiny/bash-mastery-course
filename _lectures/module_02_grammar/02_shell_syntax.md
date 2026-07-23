# Module 2.2: Basic Shell Syntax and Command Execution

## Introduction

At its core, Bash is about executing commands. Understanding the fundamental syntax for issuing commands, combining them, and controlling their execution flow is essential for writing effective scripts and interacting with the system.

## Simple Commands

A simple command is a sequence of words, where the first word is the command to be executed, and subsequent words are its arguments. Bash searches for the command in the directories specified by the `PATH` environment variable.

```bash
command_name argument1 argument2 ...
```

**Example:**

```bash
echo "Hello, World!"
ls -l /tmp
```

## Pipelines

A pipeline is a sequence of one or more commands separated by the pipe operator (`|`). The standard output of each command in the pipeline is connected to the standard input of the next command. This allows for powerful data processing by chaining utilities together.

```bash
command1 | command2 | command3
```

**Example:** Count the number of lines in a file that contain the word "error":

```bash
cat /var/log/syslog | grep "error" | wc -l
```

## Lists of Commands

Bash allows you to execute multiple commands sequentially or conditionally using various command separators.

### Command Separators

*   **`;` (Semicolon)**: Commands separated by a semicolon are executed sequentially. The exit status of the list is the exit status of the last command executed.
    ```bash
    command1 ; command2 ; command3
    ```
    **Example:**
    ```bash
echo "First command"; echo "Second command"
    ```

*   **`&` (Ampersand)**: Commands terminated by an ampersand are executed in the background (asynchronously). The shell does not wait for their completion.
    ```bash
    command1 &
    command2 & command3
    ```
    **Example:** Start a long-running process in the background.
    ```bash
sleep 10 &
echo "This message appears immediately"
    ```

*   **`&&` (Logical AND)**: `command1 && command2` executes `command2` only if `command1` exits successfully (i.e., its exit status is 0).
    ```bash
    command1 && command2
    ```
    **Example:** Create a directory and then change into it, but only if the directory creation was successful.
    ```bash
mkdir my_project && cd my_project
    ```

*   **`||` (Logical OR)**: `command1 || command2` executes `command2` only if `command1` exits with a non-zero status (i.e., it fails).
    ```bash
    command1 || command2
    ```
    **Example:** Try to start a service; if it fails, print an error message.
    ```bash
    service apache2 start || echo "Failed to start Apache!"
    ```

## Background and Foreground Processes

Bash provides mechanisms for managing processes that are running in the background or foreground [1].

*   **Foreground Process**: A process that is currently interacting with the user, receiving input from the keyboard, and sending output to the terminal. When you run a command normally, it runs in the foreground.

*   **Background Process**: A process that runs independently of the terminal, allowing you to continue using the shell for other tasks. You can send a command to the background by appending `&` to it.

    ```bash
    long_running_command &
    ```

### Job Control

Job control allows you to suspend a foreground process, move it to the background, or bring a background process to the foreground [1].

*   **`Ctrl+Z`**: Suspends the currently running foreground process. It sends a `SIGTSTP` signal to the process.
*   **`jobs`**: Lists all current jobs (background and suspended processes).
*   **`bg`**: Resumes a suspended job in the background.
    *   `bg %job_number` (e.g., `bg %1`)
*   **`fg`**: Brings a background or suspended job to the foreground.
    *   `fg %job_number` (e.g., `fg %1`)
*   **`kill`**: Sends a signal to a process, typically to terminate it.
    *   `kill %job_number` or `kill PID`

**Example Workflow:**

1.  Start a long-running command:
    ```bash
    sleep 60
    ```
2.  Press `Ctrl+Z` to suspend it.
3.  Type `jobs` to see the suspended job.
4.  Type `bg` to send it to the background.
5.  Type `fg` to bring it back to the foreground.
6.  Press `Ctrl+C` to terminate it (sends `SIGINT`).

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
