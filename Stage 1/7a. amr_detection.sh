
#!/bin/bash

# Define variables
assembly_dir="assembly"                                  # Folder containing assembled genomes.
output_dir="amr_results"                                 # Output folder.
amr_db="card"                                            # Database (Comprehensive Antibiotic Resistance Database) to use for Abricate.

# Next steps:
# Create output folder
mkdir -p $output_dir

# Process the contigs.fasta file of each sample and run Abricate to detect AMR genes
for sample_dir in $assembly_dir/*; do
    contigs_file="$sample_dir/contigs.fasta"
    if [[ -f "$contigs_file" ]]; then
        abricate --db $amr_db --quiet "$contigs_file" > "$output_dir/$(basename $sample_dir)_amr_results.tsv"
    else
        echo "Warning: contigs.fasta not found in $sample_dir"
    fi
done

echo "AMR analysis completed. Results saved in $output_dir."