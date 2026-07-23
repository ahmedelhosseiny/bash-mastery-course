# Module 7.1: Scripting for System Administration - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Scripting for System Administration
*   **Subtitle**: Automating Tasks and Managing Systems with Bash
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 7.1

## Slide 2: Introduction
*   Bash scripting is indispensable for system administrators.
*   Automate repetitive tasks, manage resources, monitor system health.
*   Streamline backups, log analysis, system monitoring, permissions, users, and groups.

## Slide 3: Automating Backups
*   Critical for data recovery.
*   Bash scripts can create, compress, and store backups.
*   **Example**: Simple directory backup with timestamp and cleanup.

## Slide 4: Backup Script Example (Conceptual)
```bash
#!/bin/bash
SOURCE_DIR="/var/www/html"
BACKUP_DIR="/mnt/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="web_data_${TIMESTAMP}.tar.gz"
# ... (log function, mkdir -p)

tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"
# ... (error check, old backup cleanup)
```

## Slide 5: Log Analysis
*   Logs contain valuable info for troubleshooting and security.
*   Bash scripts parse, filter, and summarize log data.
*   **Example**: Extracting errors from Apache logs.

## Slide 6: Log Analysis Script Example (Conceptual)
```bash
#!/bin/bash
LOG_PATH="/var/log/apache2/access.log"
OUTPUT_FILE="/tmp/apache_errors_$(date +%Y%m%d).log"
# ... (file existence check)

grep -E ".*\" (40[0-9]|...|51[0]) [0-9]+ \"" "$LOG_PATH" > "$OUTPUT_FILE"
# ... (summary with awk, error check)
```

## Slide 7: System Monitoring
*   Periodically check system health (disk, memory, processes).
*   Alert administrators to issues.
*   **Example**: Disk usage alert.

## Slide 8: Disk Usage Alert Script Example (Conceptual)
```bash
#!/bin/bash
PARTITION="/"
THRESHOLD=90
ADMIN_EMAIL="admin@example.com"

USAGE=$(df -h "$PARTITION" | awk 'NR==2 {print $5}' | sed 's/%//')

if (( USAGE > THRESHOLD )); then
    echo "Alert: Disk usage on $PARTITION is at $USAGE%..."
    # mail -s "Disk Usage Alert" "$ADMIN_EMAIL" <<< "..."
fi
```

## Slide 9: File Permissions (`chmod`) and Ownership (`chown`)
*   Core system administration tasks.
*   `chmod`: Change file mode bits (read, write, execute).
    *   Symbolic (`u+x`, `go-w`) or Octal (`755`, `644`).
*   `chown`: Change user and/or group ownership.
    *   `chown user:group file.txt`, `chown -R user:group directory/`.

## Slide 10: Permissions Script Example (Conceptual)
```bash
#!/bin/bash
WEB_ROOT="/var/www/html"
WEB_USER="www-data"; WEB_GROUP="www-data"
# ... (directory existence check)

chown -R "$WEB_USER":"$WEB_GROUP" "$WEB_ROOT"
find "$WEB_ROOT" -type d -exec chmod 775 {} \;
find "$WEB_ROOT" -type f -exec chmod 664 {} \;
```

## Slide 11: Managing Users and Groups
*   Automate creation, modification, deletion of accounts.
*   Essential in multi-user environments.
*   **Example**: Creating a new user.

## Slide 12: User Creation Script Example (Conceptual)
```bash
#!/bin/bash
USERNAME="newuser"
PASSWORD="securepassword" # Use secure methods in real scenarios

id "$USERNAME" &>/dev/null
if [ $? -ne 0 ]; then
    useradd -m -s /bin/bash "$USERNAME"
    echo "$USERNAME:$PASSWORD" | chpasswd
fi
```

## Slide 13: Conclusion
*   Bash scripting empowers system administrators.
*   Automates routine tasks, monitors systems, enforces policies.
*   Reduces manual effort and improves reliability.
*   Next: Scripting for Bioinformatics (Case Studies).

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
