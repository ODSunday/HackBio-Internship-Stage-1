#!/bin/bash

best_sample=$(for dir in */; do                                              # Loops through each directory in the current folder (quast_reports).
    n50_value=$(grep "N50" "$dir/report.txt" | awk '{print $NF}');           # Extracts N50 value from the report.txt file and stores it in the variable n50_value.
    echo "$n50_value $dir";                                                  # Prints the N50 value along with the directory name.
done | sort -n | tail -n 1 | awk '{print $2}')                               # Sort the output numerically and and selects the last entry (highest N50).
echo "Selected sample for BLAST based on N50: $best_sample"                  # Extracts just the directory name.
