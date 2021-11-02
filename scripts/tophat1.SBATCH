#!/bin/bash
#SBATCH --job-name=align2.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=mgh62@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=40G
#--------------------------------------------------------------------------#
# This script runs tophat allignment #
#--------------------------------------------------------------------------#
module load tophat 
tophat -o tophat_output \
--GTF /home/mgh62/RNAseq/Refseq/GCF_000182965.3_ASM18296v3_genomic.gff \
/home/mgh62/RNAseq/Refseq/calb_idx \
/home/mgh62/RNAseq/Refseq/WTC1_1.trPE.fq \
/home/mgh62/RNAseq/Refseq/WTC1_2.trPE.fq
#- FIN -----------------------#
