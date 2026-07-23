# Module 6.3: Job Control - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Job Control
*   **Subtitle**: Managing Processes in Bash
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 6.3

## Slide 2: Introduction
*   Manage multiple processes from a single shell session.
*   Suspend, background, foreground, terminate processes.
*   Useful for interactive shell sessions and long-running tasks.

## Slide 3: What is a Job?
*   A pipeline of one or more processes.
*   Bash assigns a job number to each job [1].

## Slide 4: Foreground and Background Processes
*   **Foreground Process**: Interacts with user (keyboard, terminal).
*   **Background Process**: Runs independently, allows shell use for other tasks.

## Slide 5: Starting a Process in the Background (`&`)
*   Append `&` to a command.
*   Shell prints job number and PID.
*   Example: `sleep 60 &`

## Slide 6: Suspending a Foreground Process (`Ctrl+Z`)
*   Pauses execution, returns control to shell.
*   Process is in a stopped state.
*   Example: `ping google.com` then `Ctrl+Z`

## Slide 7: Listing Jobs (`jobs`)
*   Lists all current jobs, their status (Running, Stopped, Done), and job numbers [1].
*   `jobs`: Basic listing.
*   `jobs -l`: Show PIDs.
*   `jobs -p`: Show only PIDs.

## Slide 8: Bringing a Job to the Foreground (`fg`)
*   Brings a background or suspended job back to the foreground [1].
*   `fg %job_number` (e.g., `fg %1`)
*   `fg` (brings current job `+` to foreground).

## Slide 9: Resuming a Job in the Background (`bg`)
*   Resumes a suspended job in the background [1].
*   `bg %job_number` (e.g., `bg %1`)
*   `bg` (resumes current job `+` in background).

## Slide 10: Terminating Jobs (`kill`)
*   Sends signals to processes (e.g., `SIGTERM` to terminate) [1].
*   `kill %job_number` (e.g., `kill %1`)
*   `kill PID`
*   `kill -9 %job_number` (force kill `SIGKILL`).

## Slide 11: Job Specifications (Jobspecs) [1]
*   Ways to refer to a job:
    *   `%n`: Job number `n`.
    *   `%string`: Command line starts with `string`.
    *   `%?string`: Command line contains `string`.
    *   `%%` or `%+`: Current job.
    *   `%-`: Previous job.

## Slide 12: `nohup` and `disown`
*   Prevent processes from terminating when shell exits.
*   **`nohup command &`**: Runs in background, immune to `SIGHUP`.
*   **`disown`**: Removes job from shell's job table, prevents `SIGHUP`.
    *   `disown` (last background job)
    *   `disown -h %1` (job 1, prevent `SIGHUP`)
    *   `disown -a` (all jobs)

## Slide 13: Conclusion
*   Job control is essential for managing processes in Bash.
*   Learned to use `&`, `Ctrl+Z`, `jobs`, `fg`, `bg`, `kill`.
*   Understood `nohup` and `disown` for persistent processes.
*   Next: Debugging Bash Scripts.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
