#!/bin/bash

mkdir qc                                                           # Creates a new folder named 'qc' for the QC reports/outputs.

for sample in selected_samples/*_1.fastq.gz selected_samples/*_2.fastq.gz; do
    fastqc "$sample" -o qc/
done                                                               # The command runs FastQC on all forward and reverse reads of the selected samples and outputs the QC reports to the "qc" folder.

ls -l qc | grep ^- | wc -l                                         # Verifies the number of files in the `qc` folder.

mkdir multiqc_reports                                              # Creates a new folder named 'multiqc_reports' for the aggregated QC reports.

multiqc qc/ -o multiqc_reports/                                    # Aggregates the QC reports and outputs them to the 'multiqc_reports' folder. 