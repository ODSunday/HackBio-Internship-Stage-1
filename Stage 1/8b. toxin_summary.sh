#!/bin/bash

# Define variables
toxin_results_dir="toxin_results"                         # Directory containing toxin result files
summary_output_dir="toxin_summary"
summary_output_file="toxin_summary/toxin_summary.csv"     # Output summary file

# Create summary output folder
mkdir -p $summary_output_dir

# Create header for the summary output file
echo "Toxin Gene,Count,Samples" > $summary_output_file

# Check if toxin results directory exists
if [[ ! -d $toxin_results_dir ]]; then
    echo "Toxin results directory not found!"
    exit 1
else
    echo "Toxin results directory exists. Proceed..."
fi

# Summarize toxin genes from all sample result files
awk 'BEGIN {FS="\t"; OFS=","}
     NR > 1 {count[$6]++; samples[$6] = (samples[$6] ? samples[$6] ";" FILENAME : FILENAME)} 
     END {for (gene in count) print gene, count[gene], samples[gene]}' $toxin_results_dir/*_toxin_results.tsv >> $summary_output_file
echo "Toxin gene summary saved to $summary_output_file"