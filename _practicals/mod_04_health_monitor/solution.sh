#!/bin/bash
# System Health Monitor
# Demonstrates: loops, logic statements, conditionals.

# Thresholds
DISK_LIMIT=80
MEM_LIMIT=90

# Get current usage
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
mem_usage=$(free | awk '/Mem/ {printf "%.0f", $3/$2 * 100}')

echo "=== System Health Status ==="
echo "Disk Usage: $disk_usage%"
echo "Memory Usage: $mem_usage%"

if [ "$disk_usage" -gt "$DISK_LIMIT" ]; then
    echo "WARNING: Disk usage is above $DISK_LIMIT%!" >&2
fi

if [ "$mem_usage" -gt "$MEM_LIMIT" ]; then
    echo "WARNING: Memory usage is above $MEM_LIMIT%!" >&2
fi
