#!/bin/bash
#SBATCH --job-name=RNAseq.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=mgh62@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G
#--------------------------------------------------------------------------#
# This script runs trimmomatic, output files go in output file directory   #
#--------------------------------------------------------------------------#
#- DEFINE FILE LOCATIONS--------------------------------------------#
trim_prog=/home/mgh62/Trimmomatic-0.39/trimmomatic-0.39.jar
adapters=/home/mgh62/Trimmomatic-0.39/adapters/TruSeq3-PE.fa
input_R1=/home/mgh62/RNAseq/Inputs/WTC1_1.fq
input_R2=/home/mgh62/RNAseq/Inputs/WTC1_2.fq
output_R1_PE=/home/mgh62/RNAseq/Outputs/WTC1_1.trPE.fq.gz
output_R1_SE=/home/mgh62/RNAseq/Outputs/WTC1_1.trSE.fq.gz
output_R2_PE=/home/mgh62/RNAseq/Outputs/WTC1_2.trPE.fq.gz
output_R2_SE=/home/mgh62/RNAseq/Outputs/WTC1_2.trSE.fq.gz
#- RUN command ----------------#
java -jar $trim_prog PE \
$input_R1 \
$input_R2 \
$output_R1_PE $output_R1_SE \
$output_R2_PE $output_R2_SE \
ILLUMINACLIP:$adapters:2:30:10 \
HEADCROP:10 \
TRAILING:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75
#- FIN -----------------------#
