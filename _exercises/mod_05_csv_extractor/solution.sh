#!/bin/bash
CSV_LINE="John,Doe,Bioinformatics,Senior Researcher"

# Split line using parameter expansions
# First remove everything before field 3
tmp="${CSV_LINE#*,*,}"
# Then remove everything after field 3
field3="${tmp%%,*}"

echo "Extracted 3rd field: $field3"
