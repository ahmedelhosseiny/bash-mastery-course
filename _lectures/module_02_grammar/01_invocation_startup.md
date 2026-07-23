# Module 2.1: Bash Invocation and Startup Files

## Introduction

When you start a Bash shell, it doesn't just present a prompt immediately. It goes through an initialization process, reading specific configuration files to set up your environment. Understanding how Bash is invoked and which files it reads is crucial for customizing your workspace and troubleshooting environment issues.

## Bash Invocation Options

Bash can be started with various command-line options that alter its behavior. These options are typically used when invoking Bash from another program or script, rather than when you log in [1].

Here are some key invocation options:

*   **`-c command_string`**: Tells Bash to read commands from the `command_string` instead of standard input or a file. This is useful for executing a single command or a short script inline.
    ```bash
    bash -c "echo 'Hello from inline Bash!'"
    ```
*   **`-i`**: Forces the shell to run interactively. This means it will prompt for input and handle job control.
*   **`-l` or `--login`**: Makes Bash act as if it had been invoked as a login shell. This affects which startup files are read.
*   **`-r` or `--restricted`**: Starts Bash in restricted mode. This disables certain features, such as changing directories (`cd`), setting the `PATH` variable, or executing commands containing a `/`. This is often used for security purposes to limit what a user can do.
*   **`-s`**: Tells Bash to read commands from standard input. This is useful when piping commands into Bash.
*   **`--noprofile`**: Prevents Bash from reading the system-wide startup file (`/etc/profile`) or any personal initialization files (`~/.bash_profile`, `~/.bash_login`, or `~/.profile`) when invoked as a login shell.
*   **`--norc`**: Prevents Bash from reading the personal initialization file (`~/.bashrc`) when invoked as an interactive, non-login shell.
*   **`--posix`**: Changes Bash's behavior to strictly conform to the POSIX standard, disabling some Bash-specific extensions.

## Types of Shells

How Bash is invoked determines which startup files it reads. There are two main distinctions:

1.  **Login vs. Non-Login Shells**
2.  **Interactive vs. Non-Interactive Shells**

### Login Shells

A login shell is the first shell you get after authenticating to the system (e.g., via SSH or at a local console). It sets up the initial environment for your session.

**Startup Files Read by a Login Shell:**

1.  `/etc/profile`: The system-wide initialization file. It sets up environment variables and paths for all users.
2.  Bash then looks for the following personal initialization files in your home directory, in this specific order, and reads the **first one it finds and is readable**:
    *   `~/.bash_profile`
    *   `~/.bash_login`
    *   `~/.profile`

When a login shell exits, it reads `~/.bash_logout` and `/etc/bash.bash_logout` (if they exist) to perform cleanup tasks.

### Interactive Non-Login Shells

An interactive non-login shell is a shell started after you have already logged in. For example, when you open a new terminal window in a desktop environment or type `bash` at an existing prompt.

**Startup Files Read by an Interactive Non-Login Shell:**

1.  `~/.bashrc`: This is the primary configuration file for interactive non-login shells. It typically contains aliases, custom functions, and prompt customizations.

*Note: It is common practice to have your `~/.bash_profile` (or `~/.profile`) source your `~/.bashrc` so that your customizations are available in both login and non-login shells.*

### Non-Interactive Shells

A non-interactive shell is typically used to run shell scripts. It does not prompt for user input.

**Startup Files Read by a Non-Interactive Shell:**

Non-interactive shells do not read the standard profile or rc files. Instead, they look for the environment variable `BASH_ENV`. If `BASH_ENV` is set, Bash expands its value and uses it as the name of a file to read and execute before running the script.

## Summary of Startup Files

| Shell Type | Reads on Startup | Reads on Exit |
| :--- | :--- | :--- |
| Interactive Login | `/etc/profile`, then first of `~/.bash_profile`, `~/.bash_login`, `~/.profile` | `~/.bash_logout`, `/etc/bash.bash_logout` |
| Interactive Non-Login | `~/.bashrc` | None |
| Non-Interactive | File specified by `$BASH_ENV` (if set) | None |

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
