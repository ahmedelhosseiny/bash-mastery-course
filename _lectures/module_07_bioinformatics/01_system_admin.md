# Module 7.1: Scripting for System Administration

## Introduction

Bash scripting is an indispensable tool for system administrators. It allows for the automation of repetitive tasks, efficient management of system resources, and proactive monitoring of server health. This module will explore common system administration tasks that can be significantly streamlined using Bash scripts, focusing on backups, log analysis, system monitoring, and managing file permissions, users, and groups.

## Automating Backups

Regular backups are critical for data recovery and business continuity. Bash scripts can automate the process of creating, compressing, and storing backups.

### Example: Simple Directory Backup

This script creates a compressed archive of a specified directory and stores it with a timestamp.

```bash
#!/bin/bash

# Configuration
SOURCE_DIR="/var/www/html" # Directory to back up
BACKUP_DIR="/mnt/backups"   # Destination for backups
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="web_data_${TIMESTAMP}.tar.gz"
LOG_FILE="/var/log/backup_script.log"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR" || { echo "Error: Cannot create backup directory."; exit 1; }

# Log function
log_message () {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "Starting backup of $SOURCE_DIR"

# Create the backup archive
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
    log_message "Backup successful: $BACKUP_FILE"
    # Optional: Clean up old backups (e.g., keep last 7 days)
    find "$BACKUP_DIR" -name "web_data_*.tar.gz" -type f -mtime +7 -delete
    log_message "Old backups cleaned up."
else
    log_message "Backup failed!"
    exit 1
fi

log_message "Backup script finished."
```

## Log Analysis

System and application logs contain valuable information for troubleshooting and security. Bash scripts can parse, filter, and summarize log data.

### Example: Extracting Errors from Apache Logs

This script searches Apache access logs for specific error codes and summarizes them.

```bash
#!/bin/bash

LOG_PATH="/var/log/apache2/access.log" # Adjust path for your system
OUTPUT_FILE="/tmp/apache_errors_$(date +%Y%m%d).log"

if [ ! -f "$LOG_PATH" ]; then
    echo "Error: Log file $LOG_PATH not found." >&2
    exit 1
fi

echo "Analyzing Apache logs for errors..."

# Search for common HTTP error codes (4xx, 5xx) and write to output file
grep -E ".*\" (40[0-9]|41[0-8]|42[1-9]|43[1]|44[4]|45[1]|50[0-5]|51[0]) [0-9]+ \"" "$LOG_PATH" > "$OUTPUT_FILE"

if [ -s "$OUTPUT_FILE" ]; then
    echo "Found errors. Summary:"
    cat "$OUTPUT_FILE" | awk 
```

## System Monitoring

Scripts can periodically check system health metrics like disk usage, memory, and running processes, alerting administrators to potential issues.

### Example: Disk Usage Alert

This script checks disk usage for a specified partition and sends an alert if it exceeds a threshold.

```bash
#!/bin/bash

PARTITION="/" # Partition to monitor
THRESHOLD=90  # Percentage threshold
ADMIN_EMAIL="admin@example.com"

# Get current disk usage percentage
USAGE=$(df -h "$PARTITION" | awk 
```

## Permissions (`chmod`, `chown`), Users and Groups

Managing file permissions and user/group ownership is a core system administration task. Bash scripts can automate these changes across multiple files or directories.

### `chmod`: Change File Permissions

`chmod` changes the file mode bits, which control read, write, and execute permissions for the owner, group, and others.

*   **Symbolic Mode**: `u` (user), `g` (group), `o` (others), `a` (all). `+` (add), `-` (remove), `=` (set exactly). `r` (read), `w` (write), `x` (execute).
    ```bash
    chmod u+x script.sh       # Add execute permission for owner
    chmod go-w file.txt       # Remove write permission for group and others
    chmod a=rw- file.txt      # Set read/write for all, no execute
    ```
*   **Octal Mode**: Three digits representing owner, group, and others. Each digit is a sum of `4` (read), `2` (write), `1` (execute).
    ```bash
    chmod 755 script.sh       # rwx for owner, rx for group/others
    chmod 644 file.txt        # rw for owner, r for group/others
    ```

### `chown`: Change File Owner and Group

`chown` changes the user and/or group ownership of files or directories.

```bash
chown user:group file.txt
chown user file.txt
chown :group file.txt
chown -R user:group directory/ # Recursive change
```

### Example: Setting Permissions for a Web Directory

This script ensures correct ownership and permissions for a web server directory.

```bash
#!/bin/bash

WEB_ROOT="/var/www/html"
WEB_USER="www-data" # Common web server user on Debian/Ubuntu
WEB_GROUP="www-data"

if [ ! -d "$WEB_ROOT" ]; then
    echo "Error: Web root directory $WEB_ROOT not found." >&2
    exit 1
fi

echo "Setting ownership and permissions for $WEB_ROOT..."

# Set ownership recursively
chown -R "$WEB_USER":"$WEB_GROUP" "$WEB_ROOT"

# Set directory permissions (read, write, execute for owner/group, read/execute for others)
find "$WEB_ROOT" -type d -exec chmod 775 {} \;

# Set file permissions (read, write for owner/group, read for others)
find "$WEB_ROOT" -type f -exec chmod 664 {} \;

echo "Permissions set successfully."
```

## Managing Users and Groups

Bash scripts can automate the creation, modification, and deletion of user accounts and groups, which is essential in multi-user environments.

### Example: Creating a New User

```bash
#!/bin/bash

USERNAME="newuser"
PASSWORD="securepassword" # In real scenarios, use secure password generation/management

# Check if user already exists
id "$USERNAME" &>/dev/null
if [ $? -eq 0 ]; then
    echo "User $USERNAME already exists."
else
    echo "Creating user $USERNAME..."
    useradd -m -s /bin/bash "$USERNAME"
    echo "$USERNAME:$PASSWORD" | chpasswd
    echo "User $USERNAME created with password."
fi
```

## Conclusion

Bash scripting is a powerful asset for system administrators, enabling them to automate routine tasks, monitor system health, and enforce security policies efficiently. By leveraging the commands and concepts discussed, you can significantly reduce manual effort and improve the reliability of your systems.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
