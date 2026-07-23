# Module 2.1: Bash Invocation and Startup Files - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Bash Invocation and Startup Files
*   **Subtitle**: How Bash Starts and Configures Itself
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 2.1

## Slide 2: Introduction
*   Bash initialization process upon startup.
*   Reads specific configuration files.
*   Crucial for customizing environment and troubleshooting.

## Slide 3: Bash Invocation Options
*   Options alter Bash behavior, often for scripts or programs [1].
*   **`-c command_string`**: Reads commands from string.
    *   Example: `bash -c "echo 'Hello!'"`
*   **`-i`**: Forces interactive shell.
*   **`-l` or `--login`**: Acts as a login shell (affects startup files).
*   **`-r` or `--restricted`**: Restricted mode (security).
*   **`-s`**: Reads commands from standard input.
*   **`--noprofile`**: Skips system/personal profile files.
*   **`--norc`**: Skips `~/.bashrc` for interactive non-login shells.
*   **`--posix`**: POSIX-conformant behavior.

## Slide 4: Types of Shells
*   **Login vs. Non-Login Shells**
*   **Interactive vs. Non-Interactive Shells**

## Slide 5: Login Shells
*   First shell after authentication (SSH, console login).
*   Sets up initial environment.
*   **Startup Files Read (in order)**:
    1.  `/etc/profile` (system-wide)
    2.  First found of: `~/.bash_profile`, `~/.bash_login`, `~/.profile`
*   **On Exit**: Reads `~/.bash_logout`, `/etc/bash.bash_logout`.

## Slide 6: Interactive Non-Login Shells
*   Shell started after login (new terminal window).
*   **Startup File Read**:
    *   `~/.bashrc` (aliases, functions, prompt customization)
*   *Note*: `~/.bash_profile` often sources `~/.bashrc`.

## Slide 7: Non-Interactive Shells
*   Typically used for running shell scripts.
*   Does not prompt for user input.
*   **Startup Files Read**:
    *   Looks for `BASH_ENV` variable.
    *   If set, reads and executes file specified by `$BASH_ENV`.

## Slide 8: Summary of Startup Files (Table)

| Shell Type | Reads on Startup | Reads on Exit |
| :--- | :--- | :--- |
| Interactive Login | `/etc/profile`, then first of `~/.bash_profile`, `~/.bash_login`, `~/.profile` | `~/.bash_logout`, `/etc/bash.bash_logout` |
| Interactive Non-Login | `~/.bashrc` | None |
| Non-Interactive | File specified by `$BASH_ENV` (if set) | None |

## Slide 9: Conclusion
*   Bash invocation options control shell behavior.
*   Different shell types (login, interactive, non-interactive) read different startup files.
*   Understanding this process is key for environment customization and debugging.
*   Next: Basic Shell Syntax and Command Execution.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
