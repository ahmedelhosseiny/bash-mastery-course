#!/bin/bash
# Pipeline log parser.
# Analyzes HTTP logs to find the count of unique IP requests.

LOG_DATA="192.168.1.10 - - [23/Jul/2026:14:32:10] \"GET /index.html HTTP/1.1\" 200 4325
192.168.1.11 - - [23/Jul/2026:14:33:11] \"POST /login HTTP/1.1\" 401 231
192.168.1.10 - - [23/Jul/2026:14:34:02] \"GET /profile HTTP/1.1\" 200 1201
192.168.1.12 - - [23/Jul/2026:14:35:15] \"GET /index.html HTTP/1.1\" 200 4325
192.168.1.11 - - [23/Jul/2026:14:36:20] \"POST /login HTTP/1.1\" 200 231"

echo "$LOG_DATA" | awk '{print $1}' | sort | uniq -c | sort -nr
