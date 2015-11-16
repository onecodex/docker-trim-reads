#!/bin/bash

# Trim reads input files

# Run trim_galore if the input file has one of a number of compatible endings
for ending in .fq.gz .fq .fastq.gz .fastq; do
    if [[ ${1: -${#ending}} == $ending ]]; then
        trim_galore --dont_gzip $1
    fi
done
