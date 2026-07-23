#!/bin/bash
# Redirection and Stream logger
# Demonstrates: duplicating file descriptors, Here-documents, custom logger.

LOG_FILE="activity.log"
ERR_FILE="error.log"

# Clear files
> "$LOG_FILE"
> "$ERR_FILE"

# Custom redirection using exec and tee
exec 3>&1 4>&2
exec 1> >(tee -a "$LOG_FILE")
exec 2> >(tee -a "$ERR_FILE" >&2)

echo "This message goes to stdout and activity.log"
echo "This error message goes to stderr and error.log" >&2

# Here-document
cat <<EOF
=== WORK SUMMARY ===
All operations ran successfully.
Logged output into $LOG_FILE.
EOF

# Restore descriptors
exec 1>&3 3>&-
exec 2>&4 4>&-
