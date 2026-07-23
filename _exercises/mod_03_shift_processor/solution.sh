#!/bin/bash
echo "Total arguments received: $#"
while [ $# -gt 0 ]; do
    echo "Processing: $1"
    shift
done
