#!/bin/bash

# Make an output directory.
mkdir combined_quast_reports

# Define an array to hold the paths to the contigs.fasta files.
declare -a samples=()

# Populate the array with paths to each contigs.fasta file.
for sample_dir in assembly/*/; do
    samples+=("${sample_dir}contigs.fasta")
done

# Run quast on all samples at a go, using the array.
quast.py -o combined_quast_reports "${samples[@]}"