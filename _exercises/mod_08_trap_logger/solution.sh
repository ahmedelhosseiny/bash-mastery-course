#!/bin/bash
failure_log() {
    echo "ERROR: Command failed at line number: $1" >&2
}
trap 'failure_log $LINENO' ERR

# Trigger error deliberately
non_existent_command
