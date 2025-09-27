#!/bin/bash

# Define variables
assembly_dir="assembly"                    # Folder containing assembled genomes.
output_dir="toxin_results"                 # Output folder.
toxin_db="vfdb"                            # Database (Virulent Factor Database) to use for Abricate.

# Create output directory
mkdir -p $output_dir

# Process the contigs.fasta file of each sample and run Abricate to detect toxin genes
for sample_dir in $assembly_dir/*; do
    contigs_file="$sample_dir/contigs.fasta"
    if [[ -f "$contigs_file" ]]; then
        abricate --db $toxin_db --quiet "$contigs_file" > "$output_dir/$(basename $sample_dir)_toxin_results.tsv"
    else
        echo "Warning: contigs.fasta not found in $sample_dir"
    fi
done

echo "Toxin gene analysis completed. Results saved in $output_dir."
