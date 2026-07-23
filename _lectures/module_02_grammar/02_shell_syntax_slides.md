# Module 2.2: Basic Shell Syntax and Command Execution - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Basic Shell Syntax and Command Execution
*   **Subtitle**: Building Blocks of Bash Interaction
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 2.2

## Slide 2: Introduction
*   Executing commands is core to Bash.
*   Understanding syntax for commands, combining them, and controlling flow is essential.

## Slide 3: Simple Commands
*   First word is command, subsequent words are arguments.
*   Bash searches `PATH` for command.
*   Syntax: `command_name argument1 argument2 ...`
*   Examples:
    *   `echo "Hello, World!"`
    *   `ls -l /tmp`

## Slide 4: Pipelines (`|`)
*   Sequence of commands separated by `|`.
*   `stdout` of one command becomes `stdin` of the next.
*   Syntax: `command1 | command2 | command3`
*   Example: Count lines with "error" in syslog:
    *   `cat /var/log/syslog | grep "error" | wc -l`

## Slide 5: Lists of Commands: Semicolon (`;`) and Ampersand (`&`)
*   **`;` (Semicolon)**:
    *   Commands executed sequentially.
    *   Exit status is of the last command.
    *   Example: `echo "First"; echo "Second"`
*   **`&` (Ampersand)**:
    *   Commands executed in background (asynchronously).
    *   Shell does not wait for completion.
    *   Example: `sleep 10 &`

## Slide 6: Lists of Commands: Logical AND (`&&`) and Logical OR (`||`)
*   **`&&` (Logical AND)**:
    *   `command2` executes only if `command1` succeeds (exit status 0).
    *   Example: `mkdir my_project && cd my_project`
*   **`||` (Logical OR)**:
    *   `command2` executes only if `command1` fails (non-zero exit status).
    *   Example: `service apache2 start || echo "Failed!"`

## Slide 7: Background and Foreground Processes
*   **Foreground Process**: Interacts with user (keyboard input, terminal output).
*   **Background Process**: Runs independently, allows shell use for other tasks.
    *   Started with `&` (e.g., `long_command &`)

## Slide 8: Job Control Commands [1]
*   **`Ctrl+Z`**: Suspends foreground process (`SIGTSTP`).
*   **`jobs`**: Lists all current jobs.
*   **`bg`**: Resumes suspended job in background (e.g., `bg %1`).
*   **`fg`**: Brings background/suspended job to foreground (e.g., `fg %1`).
*   **`kill`**: Sends signal to process (e.g., `kill %1` or `kill PID`).

## Slide 9: Job Control Workflow Example
1.  Start `sleep 60`.
2.  Press `Ctrl+Z` (suspends).
3.  Type `jobs` (shows suspended job).
4.  Type `bg` (sends to background).
5.  Type `fg` (brings to foreground).
6.  Press `Ctrl+C` (terminates).

## Slide 10: Conclusion
*   Understood simple commands, pipelines, and command lists.
*   Learned to manage processes in foreground/background.
*   Key job control commands: `&`, `Ctrl+Z`, `jobs`, `fg`, `bg`, `kill`.
*   Next: Quoting Mechanisms.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
