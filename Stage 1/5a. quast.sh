#!/bin/bash

mkdir quast_reports

for sample_dir in assembly/*/; do                                # Loops through each sample directory within assembly folder.
    sample=$(basename "$sample_dir")                             # Extracts the base name (sample name) of the sample directory.
    contigs_file="${sample_dir}contigs.fasta"                    # Constructs the full path to the contigs.fasta file.

    if [[ -f "$contigs_file" ]]; then                            # Checks for the presence of the contigs.fasta file before running 'quast'.
        quast.py -o "quast_reports/${sample}_quast" "$contigs_file"
    else
        echo "Warning: File not found for sample ${sample}: $contigs_file"
    fi
done

ls -l quast_reports | grep ^d | wc -l                            # Confirms the directories in the `quast_reports` folder.