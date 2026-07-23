# Module 6.3: Job Control

## Introduction

Job control is a feature in Unix-like operating systems that allows users to manage multiple processes (jobs) from a single shell session. It enables you to suspend a running process, move it to the background, bring a background process to the foreground, and terminate processes. This is particularly useful in interactive shell sessions where you might need to temporarily pause a long-running task to perform another action.

## What is a Job?

In the context of job control, a **job** refers to a pipeline of one or more processes. When you execute a command or a series of commands connected by pipes, Bash treats this as a single job. Each job is assigned a job number by the shell, which can be used to refer to it [1].

## Foreground and Background Processes

*   **Foreground Process**: A process that is currently interacting with the user. It receives input from the keyboard and sends output to the terminal. When you execute a command normally, it runs in the foreground.

*   **Background Process**: A process that runs independently of the terminal, allowing you to continue using the shell for other tasks. Background processes do not receive input from the keyboard by default and their output might interleave with your current terminal activity.

## Managing Jobs

### 1. Starting a Process in the Background (`&`)

You can start a command directly in the background by appending an ampersand (`&`) to the end of the command.

```bash
long_running_command &
```

When a command is sent to the background, Bash will print a job number in square brackets and the process ID (PID) of the last command in the pipeline.

**Example:**

```bash
sleep 60 &
# Output: [1] 12345
```

Here, `[1]` is the job number, and `12345` is the PID of the `sleep` command.

### 2. Suspending a Foreground Process (`Ctrl+Z`)

If a command is already running in the foreground, you can suspend it by pressing `Ctrl+Z`. This sends a `SIGTSTP` signal to the process, pausing its execution and returning control to the shell. The process is now in a stopped state.

**Example:**

1.  Run a command: `ping google.com`
2.  Press `Ctrl+Z`
3.  The output will show something like: `[1]+  Stopped                 ping google.com`

### 3. Listing Jobs (`jobs`)

The `jobs` command lists all current jobs managed by the shell, along with their status (Running, Stopped, Done) and job numbers [1].

```bash
jobs
jobs -l # Show PIDs as well
jobs -p # Show only PIDs
```

**Example Output:**

```
[1]-  Stopped                 ping google.com
[2]+  Running                 sleep 60 &
```

*   `+`: Indicates the current job (the one that would be acted upon by `fg` or `bg` without a jobspec).
*   `-`: Indicates the previous job.

### 4. Bringing a Job to the Foreground (`fg`)

The `fg` command brings a background or suspended job back to the foreground, allowing it to interact with the terminal again [1].

```bash
fg %job_number
fg %job_name_prefix
fg # Brings the current job (+) to foreground
```

**Example:**

```bash
fg %1 # Brings job 1 to the foreground
```

### 5. Resuming a Job in the Background (`bg`)

The `bg` command resumes a suspended job in the background [1].

```bash
bg %job_number
bg %job_name_prefix
bg # Resumes the current job (+) in the background
```

**Example:**

```bash
bg %1 # Resumes job 1 in the background
```

### 6. Terminating Jobs (`kill`)

The `kill` command is used to send signals to processes, typically to terminate them. While `kill` can be used with PIDs, it can also be used with job numbers [1].

```bash
kill %job_number
kill PID
```

**Example:**

```bash
kill %1 # Sends SIGTERM to job 1
kill -9 %1 # Sends SIGKILL (force kill) to job 1
```

## Job Specifications (Jobspecs) [1]

Bash provides several ways to refer to a job:

*   **`%n`**: Refers to job number `n` (e.g., `%1`).
*   **`%string`**: Refers to a job whose command line begins with `string`.
*   **`%?string`**: Refers to a job whose command line contains `string`.
*   **`%%` or `%+`**: Refers to the shell's notion of the current job (the last job stopped or started in the background).
*   **`%-`**: Refers to the previous job.

## `nohup` and `disown`

When you log out of a shell session, all processes associated with that session (including background jobs) typically receive a `SIGHUP` signal and are terminated. To prevent this, you can use `nohup` or `disown`.

*   **`nohup command &`**: Runs a command in the background, making it immune to `SIGHUP` signals. Its output is redirected to `nohup.out` by default if not explicitly redirected.

    ```bash
nohup long_running_script.sh &
    ```

*   **`disown`**: Removes jobs from the shell's job table. This means the shell will no longer send `SIGHUP` to these processes when it exits. The process will continue to run even after the shell closes.

    ```bash
    long_running_command &
    disown # Disowns the last background job
    disown -h %1 # Disowns job 1 and prevents SIGHUP
    disown -a # Disowns all jobs
    ```

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
