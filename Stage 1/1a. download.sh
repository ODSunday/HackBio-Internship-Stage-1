#!/bin/bash

wget https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/SA_Polony_100_download.sh   # Downloads the script provided.

bash SA_Polony_100_download.sh                   # Downloads the data from the script provided.
ls 						                         # Confirms downloaded files.
mkdir raw_data                                   # Creates a new folder for the data.
mv *.fastg.gz raw_data/                          # Moves all the data (ending with the '.fastg.gz' suffix) into to 'raw_data' folder. 

ls -l raw_data | grep ^- | wc -l                 # Confirms the presence and numbers of the files in the 'raw_data' folder.
# ls -l list the files with their details; grep ^- filters regular files only, without folder; wc -l counts number lines, which is equivalent to the number of files in the folder.