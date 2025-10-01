#!/bin/bash

{
  echo "FastQC Version:"
  fastqc --version
  echo ""
  
  echo "MultiQC Version:"
  multiqc --version
  echo ""
  
  echo "fastp Version:"
  fastp -v
  echo ""
  
  echo "SPAdes Version:"
  spades.py --version
  echo ""
  
  echo "QUAST Version:"
  quast.py --version
  echo ""
  
  echo "BLAST Version:"
  blastn -version
  echo ""
  
  echo "Abricate Version:"
  abricate --version
} > tool_versions.txt
