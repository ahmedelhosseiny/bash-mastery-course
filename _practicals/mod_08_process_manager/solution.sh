#!/bin/bash
# Asynchronous background job manager.
# Demonstrates: bg, wait, jobs, traps, kill.

# Handler for SIGINT
cleanup_jobs() {
    echo "User aborted! Killing running background tasks..."
    jobs -p | xargs -r kill
    exit 1
}
trap cleanup_jobs SIGINT

echo "Launching 3 parallel sleep tasks..."
sleep 10 &
pid1=$!
sleep 10 &
pid2=$!
sleep 10 &
pid3=$!

echo "Jobs running with PIDs: $pid1, $pid2, $pid3"
echo "Waiting for background processes to finish (press Ctrl+C to abort)..."
wait
echo "All tasks finished."
