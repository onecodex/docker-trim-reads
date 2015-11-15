# docker-trim-reads
Trim FASTA/Q files

Use trim_galore -- http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/

Version 0.4.1

Requires cutadapt

## File naming conventions

### Gzip

trim_galore automatically detects gzip-compressed input files and strips that extension from the output file name

### FASTA

FASTA files are not processed correctly, and return an error from trim_galore.

### FASTQ/FQ

Whether a files ends in `fastq` or `fq`, that extension will be stripped from the output file name

### `_trimmed.fq`

After stripping `.gz` and/or `.fastq` or `.fq`, the suffix `_trimmed.fq` will be appended to the name of the output file

## Gzip output

By default, the output of trim_galore is gzip-compressed. Using the `--dont_gzip` flag ensures that the output is not compressed.

## Trimming summary

The second output file is a summary of the trimming that took place. That file has the name of the input file (retaining the `.fastq/fq(.gz)`) + `_trimming_report.txt`
