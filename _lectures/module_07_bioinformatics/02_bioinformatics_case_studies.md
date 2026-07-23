# Module 7.2: Scripting for Bioinformatics (Case Studies)

## Introduction

Bioinformatics often involves processing large volumes of data from various sources, such as sequencing machines, public databases, and experimental results. Bash scripting is an invaluable tool for bioinformaticians to automate repetitive tasks, orchestrate complex analysis pipelines, and manipulate text-based biological data formats efficiently. This module will explore practical case studies demonstrating how Bash can be applied in bioinformatics workflows.

## Processing Large Data Files

Biological data often comes in text-based formats that can be very large. Bash commands like `cat`, `grep`, `awk`, `sed`, `sort`, and `cut` are highly effective for initial data inspection, filtering, and transformation.

### Case Study 1: Filtering FASTQ Files by Quality Score

FASTQ is a text-based format for storing both a nucleotide sequence and its corresponding quality scores. A common task is to filter reads based on their average quality.

Assume we have a `sample.fastq` file. Each read consists of four lines:
1.  Identifier (starts with `@`)
2.  Sequence
3.  Plus sign (starts with `+`)
4.  Quality scores (Phred scores, ASCII encoded)

We want to filter out reads where the average quality score is below a certain threshold (e.g., 30).

```bash
#!/bin/bash

FASTQ_FILE="sample.fastq"
OUTPUT_FILE="filtered_sample.fastq"
QUALITY_THRESHOLD=30

if [ ! -f "$FASTQ_FILE" ]; then
    echo "Error: FASTQ file $FASTQ_FILE not found." >&2
    exit 1
fi

echo "Filtering $FASTQ_FILE by quality score (threshold: $QUALITY_THRESHOLD)..."

# This script is conceptual and would typically use a dedicated bioinformatics tool
# or a more complex awk/python script for accurate quality score calculation.
# For demonstration, we'll simulate a simple filter based on line content.
# A real-world solution would involve decoding Phred scores.

# Example: A simplified approach to demonstrate line-by-line processing
# This example assumes a simple quality check for demonstration purposes.
# In reality, Phred scores need to be converted from ASCII to numeric values.

awk -v THRESH="$QUALITY_THRESHOLD" '
BEGIN {ORS=""} # Output Record Separator

# Process every 4 lines as a block (a FASTQ record)
{ buffer[NR%4] = $0 }
(NR%4) == 0 {
    # This is the 4th line (quality scores)
    # Simplified check: if the quality line contains a specific low-quality character (e.g., #), filter it out
    # A real implementation would calculate average Phred score
    if (buffer[0] !~ /#/) { # Conceptual: if quality line doesn't contain a low-quality marker
        print buffer[1]"\n"buffer[2]"\n"buffer[3]"\n"buffer[0]"\n"
    }
}
' "$FASTQ_FILE" > "$OUTPUT_FILE"

# A more realistic approach would involve a Python script or a tool like fastp/fastqc
# For instance, using a Python script (conceptual):
# python3 -c '
# import sys
# from Bio import SeqIO
# for record in SeqIO.parse(sys.argv[1], "fastq"):
#     avg_qual = sum(record.letter_annotations["phred_quality"]) / len(record)
#     if avg_qual >= float(sys.argv[2]):
#         SeqIO.write(record, sys.stdout, "fastq")
# ' "$FASTQ_FILE" "$QUALITY_THRESHOLD" > "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Filtering complete. Filtered reads saved to $OUTPUT_FILE"
    echo "Original reads: $(grep -c "^@" "$FASTQ_FILE")"
    echo "Filtered reads: $(grep -c "^@" "$OUTPUT_FILE")"
else
    echo "Filtering failed!"
    exit 1
fi
```

### Case Study 2: Extracting Specific Fields from a VCF File

VCF (Variant Call Format) files store genetic variation data. Often, you need to extract specific columns or filter entries based on certain criteria.

Assume `variants.vcf` contains genetic variant information. We want to extract the CHROM, POS, ID, REF, ALT, and FILTER columns for variants that passed all filters (`FILTER=PASS`).

```bash
#!/bin/bash

VCF_FILE="variants.vcf"
OUTPUT_FILE="filtered_variants.tsv"

if [ ! -f "$VCF_FILE" ]; then
    echo "Error: VCF file $VCF_FILE not found." >&2
    exit 1
fi

echo "Extracting filtered variants from $VCF_FILE..."

# Extract header lines starting with ##
grep "^##" "$VCF_FILE" > "$OUTPUT_FILE"

# Extract the header line starting with # (single hash) and replace with tab-separated fields
grep "^#CHROM" "$VCF_FILE" | sed -E 's/^#//' | tr '\t' '\t' >> "$OUTPUT_FILE"

# Extract data lines where FILTER column is 'PASS'
# VCF columns: #CHROM POS ID REF ALT QUAL FILTER INFO FORMAT sample1 sample2...
# FILTER is the 7th column (1-indexed)
awk 'BEGIN {OFS="\t"} /^#/ {next} $7 == "PASS" {print $1, $2, $3, $4, $5, $7}' "$VCF_FILE" >> "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Extraction complete. Filtered variants saved to $OUTPUT_FILE"
else
    echo "Extraction failed!"
    exit 1
fi
```

## Orchestrating Bioinformatics Tools

Bioinformatics analysis often involves running a sequence of different tools. Bash scripts are excellent for creating pipelines that connect these tools, passing outputs from one as inputs to the next.

### Case Study 3: Simple RNA-Seq Alignment Pipeline (Conceptual)

This conceptual script outlines a basic RNA-Seq alignment workflow using common tools like `fastqc`, `trim_galore`, `STAR`, and `samtools`. (Note: Actual installation and configuration of these tools are prerequisites and beyond the scope of this script).

```bash
#!/bin/bash

# Configuration
READS_DIR="raw_reads"
GENOME_DIR="reference_genome"
OUTPUT_DIR="analysis_results"

# Tools (assuming they are in PATH or full paths are provided)
FASTQC="fastqc"
TRIM_GALORE="trim_galore"
STAR="STAR"
SAMTOOLS="samtools"

# Reference files (conceptual)
GENOME_FASTA="$GENOME_DIR/genome.fasta"
GENOME_GTF="$GENOME_DIR/genes.gtf"
STAR_INDEX_DIR="$GENOME_DIR/star_index"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Function for logging
log_step () {
    echo "$(date +%Y-%m-%d %H:%M:%S) - STEP: $1"
}

# --- Step 1: Quality Control with FastQC ---
log_step "Running FastQC on raw reads"
for R1_FILE in "$READS_DIR"/*_R1.fastq.gz;
do
    R2_FILE="${R1_FILE/_R1/_R2}"
    "$FASTQC" "$R1_FILE" "$R2_FILE" -o "$OUTPUT_DIR/fastqc_raw"
    if [ $? -ne 0 ]; then echo "FastQC failed for $R1_FILE"; exit 1; fi
done

# --- Step 2: Adapter Trimming with Trim Galore ---
log_step "Trimming adapters with Trim Galore"
mkdir -p "$OUTPUT_DIR/trimmed_reads"
for R1_FILE in "$READS_DIR"/*_R1.fastq.gz;
do
    R2_FILE="${R1_FILE/_R1/_R2}"
    SAMPLE_NAME=$(basename "$R1_FILE" _R1.fastq.gz)
    "$TRIM_GALORE" --paired --output_dir "$OUTPUT_DIR/trimmed_reads" "$R1_FILE" "$R2_FILE"
    if [ $? -ne 0 ]; then echo "Trim Galore failed for $SAMPLE_NAME"; exit 1; fi
done

# --- Step 3: Build STAR Genome Index (if not already built) ---
if [ ! -d "$STAR_INDEX_DIR" ]; then
    log_step "Building STAR genome index"
    "$STAR" --runMode genomeGenerate \
           --genomeDir "$STAR_INDEX_DIR" \
           --genomeFastaFiles "$GENOME_FASTA" \
           --sjdbGTFfile "$GENOME_GTF" \
           --sjdbOverhang 100 # Adjust based on read length
    if [ $? -ne 0 ]; then echo "STAR index generation failed"; exit 1; fi
else
    log_step "STAR genome index already exists."
fi

# --- Step 4: Alignment with STAR ---
log_step "Aligning reads with STAR"
mkdir -p "$OUTPUT_DIR/alignments"
for R1_TRIMMED in "$OUTPUT_DIR/trimmed_reads"/*_R1_val_1.fq.gz;
do
    R2_TRIMMED="${R1_TRIMMED/_R1_val_1.fq.gz/_R2_val_2.fq.gz}"
    SAMPLE_NAME=$(basename "$R1_TRIMMED" _R1_val_1.fq.gz)
    "$STAR" --runThreadN 8 \
           --genomeDir "$STAR_INDEX_DIR" \
           --readFilesIn "$R1_TRIMMED" "$R2_TRIMMED" \
           --readFilesCommand zcat \
           --outFileNamePrefix "$OUTPUT_DIR/alignments/${SAMPLE_NAME}_" \
           --outSAMtype BAM SortedByCoordinate \
           --outSAMunmapped None \
           --quantMode GeneCounts
    if [ $? -ne 0 ]; then echo "STAR alignment failed for $SAMPLE_NAME"; exit 1; fi
done

# --- Step 5: Index BAM files with Samtools ---
log_step "Indexing BAM files with Samtools"
for BAM_FILE in "$OUTPUT_DIR/alignments"/*.bam;
do
    "$SAMTOOLS" index "$BAM_FILE"
    if [ $? -ne 0 ]; then echo "Samtools index failed for $BAM_FILE"; exit 1; fi
done

log_step "RNA-Seq alignment pipeline complete."
```

## Conclusion

Bash scripting is an indispensable skill for bioinformaticians, enabling efficient data manipulation, automation of complex workflows, and integration of diverse tools. By mastering these scripting techniques, you can significantly enhance your productivity and the reproducibility of your bioinformatics analyses.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
