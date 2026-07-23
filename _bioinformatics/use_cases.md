# Bash in Bioinformatics - Specialized Use Cases

In genomics and proteomics, datasets regularly scale to gigabytes or terabytes (e.g. raw NGS sequencing runs). Processing these files via standard graphic interfaces or resource-heavy high-level programming scripts can cause memory issues. Bash is designed for low-memory, fast, stream-based command pipelines, making it the perfect tool for biological data workflows.

## 1. Quality Control & Filtering (FASTQ)
FASTQ files contain millions of sequencing reads, where each read has 4 lines (header, sequence, description, Phred quality). 
- We can filter out sequence adapters, crop sequences, and calculate reads quality scores.

## 2. Sequence Length & GC Content calculation (FASTA)
FASTA format is a simple text structure containing a sequence header (starting with `>`) followed by sequence lines.
- Calculating GC content tells us the ratio of Guanine and Cytosine bases, indicating sequence stability.

## 3. Variant Calling Analysis (VCF)
VCF (Variant Call Format) details biological mutations. 
- You can filter out variants with low coverage, select specific chromosomes, or extract annotation columns using standard filters like `awk`.
