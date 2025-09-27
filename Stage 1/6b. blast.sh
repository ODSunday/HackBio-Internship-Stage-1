#!/bin/bash

# Define output directory name
output_folder="blast_report"

# Create the output directory
mkdir -p "$output_folder"

# Define the path to the spades.py output directory
spades_output="assembly" 

# Define the path to the contig file
contig_file="$spades_output/SRR27013333_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_spades/contigs.fasta"

# Confirm the existence of the contig file
if [[ ! -f "$contig_file" ]]; then
    echo "Contig file NOT FOUND!: $contig_file"
    exit 1
else
    echo "Contig file EXISTS!: $contig_file"
fi

# Extract the first 100 contigs (i.e., extract the first 202 lines from the fasta file, since each contig consists of 2 lines: header + sequence).
head -n 202 "$contig_file" | awk 'NR % 2 == 1 {print; getline; print}' > extracted_contigs.fasta

echo "Contigs extracted SUCCESSFULLY!"

# Run BLAST
echo "Running BLAST to confirm organism's identity..."

blastn -query extracted_contigs.fasta -db nt -out "$output_folder/blast_results.tsv" \
       -outfmt "6 std stitle" \
       -evalue 1e-5 -remote -max_target_seqs 10

echo "BLAST run successfully!"

# Confirm the identification of Listeria monocytogenes
if grep -q -i "listeria" "$output_folder/blast_results.tsv"; then
    echo "SUCCESS!: BLAST succesfully identified Listeria monocytogenes!"
else
    echo "FAIL!: BLAST could not indentify Listeria monocytogenes."
fi