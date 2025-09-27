#!/bin/bash

# Define variables
amr_results_dir="amr_results"                         # Directory containing AMR result files
summary_output_dir="amr_summary"
summary_output_file="amr_summary/amr_summary.csv"     # Output summary file

# Create summary output folder
mkdir -p $summary_output_dir

# Create header for the summary output file
echo "Gene,Count,Samples" > $summary_output_file

# Confirm the existence of AMR results directory
if [[ ! -d $amr_results_dir ]]; then
    echo "AMR results directory not found!"
    exit 1
else
    echo "AMR results directory exists. Proceed..."
fi

# Summarize AMR profiles from all sample result files
awk 'BEGIN {FS="\t"; OFS=","}
     NR > 1 {count[$6]++; samples[$6] = (samples[$6] ? samples[$6] ";" FILENAME : FILENAME)} 
     END {for (gene in count) print gene, count[gene], samples[gene]}' $amr_results_dir/*_amr_results.tsv >> $summary_output_file

echo "AMR profile summary saved to $summary_output_file"