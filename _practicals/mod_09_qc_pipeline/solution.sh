#!/bin/bash
# Bioinformatics QC Pipeline
# Demonstrates: Parsing FASTQ, sequences filtering, counting stats.

FASTQ_FILE="sample.fastq"

if [ ! -f "$FASTQ_FILE" ]; then
    # Create sample FASTQ file if not present
    cat <<EOF > "$FASTQ_FILE"
@SEQ1
GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT
+
!''*((((***+))%%%++)(%%%%).1***-+&*````````````````````````
@SEQ2
ATGCATGCATGCATGCATGCATGCATGCATGCATGCATGCATGCATGCATGCATGCATGC
+
IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
@SEQ3
GATCGATCGATCGATCGATCGATCGATCGATCGATCGATCGATCGATCGATCGATCGATC
+
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
EOF
fi

# Count reads
total_reads=$(grep -c "^@" "$FASTQ_FILE")
echo "Total FASTQ reads: $total_reads"

# Find low quality reads (containing '!' in the quality block)
echo "Filtering sequences with low-quality scores..."
awk '
NR%4 == 1 { id = $0 }
NR%4 == 2 { seq = $0 }
NR%4 == 0 {
    qual = $0
    if (qual ~ /!/) {
        print "Low Quality Read: " id " -> " seq
    }
}
' "$FASTQ_FILE"
