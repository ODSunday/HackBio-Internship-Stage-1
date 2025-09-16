# HackBio-Internship-Stage-1: Whole Genome Sequencing (WGS)
Whole genome sequencing (WGS) pipelines considered in this stage include reference based and de novo sequence assemblies, applied in three mini projects as:
* Microbes
* Plant
* Human
## PORJECT 1: WHOLE GENOME SEQUENCING ANALYSIS OF THE SOUTH AFRICAN POLONY OUTBREAK
### INTRODUCTION
South Africa faced a serious public health problem in early 2017 due to a foodborne infection traced to polony, a processed cold meats. To confirm the identity and resistance profile of the infectious organism, whole genome sequencing (WGS) analysis becomes highly indispensable. Hence, this current project analyses WGS data from 100 bacterial isolates collected during the 2017–2018 South African outbreak, to:  
- Confirm the identity of the organism;
- Determine the antimicrobial resistance (AMR) profile of these pathogens.
- Detect the presence of any toxin accelerating the death rate.
- Suggest possible antibiotics or treatment options for managing the cases.

### METHOD
#### 1a. Downloading the datasets
The script containing the datasets was provided at: `https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/SA_Polony_100_download.sh`. 
The script and the datasets were downloaded and saved properly using the following commands:
```bash
wget https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/SA_Polony_100_download.sh   # Downloads the script provided.

bash SA_Polony_100_download.sh                   # Downloads the data from the script provided.
ls 						                         # Confirms downloaded files.
mkdir raw_data                                   # Creates a new folder for the data.
mv *.fastg.gz raw_data/                          # Moves all the data (ending with the ".fastg.gz" suffix) into to 'raw_data' folder. 

ls -l raw_data | grep ^- | wc -l                 # Confirms the presence and numbers of the files in the 'raw_data' folder.
# ls -l list the files with their details; grep ^- filters regular files only, without folder; wc -l counts number lines, which is equivalent to the number of files in the folder.
```

#### 1b. Downsizing to 50 samples
The 100 samples were downsized to 50, using the following commands:
```bash
mkdir selected_samples                            # Creates a new folder for the randomly selceted data.

for base_name in $(ls raw_data/*_1.fastq.gz | sed 's/_1.fastq.gz//' | shuf -n 50); do   
    cp "${base_name}_1.fastq.gz" selected_samples/                                      
    cp "${base_name}_2.fastq.gz" selected_samples/                                      
done

# ls raw_data/*_1.fastq.gz lists only all forward read files, to forestall duplications;
# sed 's/_1.fastq.gz//' removes the _1.fastq.gz suffix to obtain only the base names; shuf -n 50 randomly selects 50 unique base names.
# The for loop then loops through each selected base name, and
# cp "${base}_1.fastq.gz" sample_data/ copies the corresponding forward read of the randomly selected sample into the sample_data folder, while
# cp "${base}_2.fastq.gz" sample_data/ copies the corresponding reverse read into the folder.

ls -l selected_samples | grep ^- | wc -l          # Confirms the presence and numbers of the files in the 'selected_samples' folder.
```



