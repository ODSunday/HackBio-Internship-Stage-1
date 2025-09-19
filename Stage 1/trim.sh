#!/bin/bash

for sample in $(ls selected_samples/*_1.fastq.gz | sed 's|.*/||; s/_1.fastq.gz//'); do
    fastp -i "selected_samples/${sample}_1.fastq.gz" \
          -I "selected_samples/${sample}_2.fastq.gz" \
          -o "trimmed_samples/${sample}_1_trimmed.fastq.gz" \
          -O "trimmed_samples/${sample}_2_trimmed.fastq.gz" \
          --html "fastp_reports/${sample}_fastp.html" \
          --json "fastp_reports/${sample}_fastp.json" \
          -q 20 -u 10 -l 50 --trim_front1 5 --trim_front2 5 \
          --cut_mean_quality 20 \
          --cut_front \
          --cut_tail \
          --cut_right \
          --detect_adapter_for_pe
done                     