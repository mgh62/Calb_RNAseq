#!/bin/bash
#SBATCH --job-name=align.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=mgh62@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G
#--------------------------------------------------------------------------#
# This script runs bowtie2 #
#--------------------------------------------------------------------------#
module load bowtie2 
bowtie2 -x /home/mgh62/RNAseq/Refseq/calb_idx \
-1 /home/mgh62/RNAseq/Refseq/WTC1_1.trPE.fq \
-2 /home/mgh62/RNAseq/Refseq/WTC1_2.trPE.fq \
-S /home/mgh62/RNAseq/Refseq/WTC1.sam
module unload bowtie2
#- FIN -----------------------#
