#!/bin/bash

for sample in $(ls trimmed_samples/*_1_trimmed.fastq.gz | sed 's|.*/||; s/_1_trimmed.fastq.gz//'); do
    spades.py -1 "trimmed_samples/${sample}_1_trimmed.fastq.gz" \
              -2 "trimmed_samples/${sample}_2_trimmed.fastq.gz" \
              -o "assembly/${sample}_spades" \
	      --threads 4 \
              --phred-offset 33
done