#!/bin/bash
FASTA_FILE="data/sample.fasta"

# If the sample file does not exist, write the sample content
if [ ! -f "$FASTA_FILE" ]; then
    mkdir -p data
    cat <<EOF > "$FASTA_FILE"
>seq1
ATGCGTACGTACGTAGCTAGCTAGCTAGC
>seq2
ATGGCCGTTACGTAGCTAGCTAGCTAGC
EOF
fi

# Parse GC content percentage
awk '
/^>/ { next }
{
    seq = seq $0
}
END {
    # Count Gs and Cs
    g = gsub(/[Gg]/, "", seq)
    c = gsub(/[Cc]/, "", seq)
    total = length(seq)
    gc = g + c
    printf "GC Content: %.2f%%\n", (gc / total) * 100
}
' "$FASTA_FILE"
