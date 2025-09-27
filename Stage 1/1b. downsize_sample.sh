#!/bin/bash

mkdir selected_samples                            # Creates a new folder for the randomly selceted data.

for base_name in $(ls raw_data/*_1.fastq.gz | sed 's/_1.fastq.gz//' | shuf -n 50); do   
    cp "${base_name}_1.fastq.gz" selected_samples/                                      
    cp "${base_name}_2.fastq.gz" selected_samples/                                      
done

# ls raw_data/*_1.fastq.gz lists only all forward read files, to forestall duplications;
# sed 's/_1.fastq.gz//' removes the _1.fastq.gz suffix to obtain only the base names; shuf -n 50 randomly selects 50 unique base names.
# The for loop then iterates over each of the selected base name, and
# cp "${base_name}_1.fastq.gz" sample_data/ copies the corresponding forward read of the randomly selected sample into the sample_data folder, while
# cp "${base_name}_2.fastq.gz" sample_data/ copies the corresponding reverse read into the folder.

ls -l selected_samples | grep ^- | wc -l          # Confirms the presence and numbers of the files in the 'selected_samples' folder.