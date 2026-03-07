##! /bin/bash
# the options below are for the HPC queueing system
# OPTIONS FOR GRID ENGINE ==============================================================
#
#$ -S /bin/bash
#$ -l h_rt=1:00:00
#$ -l h_vmem=1G
#$ -pe smp 8
#$ -cwd
#$ -j y
#$ -V
#$ -m be
# OPTIONS FOR GRID ENGINE=================================================================
#!/bin/bash

# Create necessary directories if they do not exist
# Change home_dir to personal home directory as appropriate 

#example of running fastqc on one of the raw data files
/nobackup/leedsomics_tools/FastQC/fastqc -o SRR7407832 -threads 4 -dir temp /nobackup/biol5178M/group5/SRR7407832.fastqc.gz

#trimming 
for filename in SRR74078*.fastq.gz;
do
/nobackup/leedsomics_tools/TrimGalore-0.6.6/trim_galore --path_to_cutadapt /nobackup/leedsomics_tools/cutadapt -o data_trim -fastqc /nobackup/biol5178M/group5
done

#quantification using salmon
for fn in data_trim/*34_trimmed.fq.gz;
do
samp=`basename ${fn}`
echo "Processing sample data_trim/${samp}"
salmon quant -i Index2 -l A -r data_trim/${samp} -p 8 --validateMapping -o quants/${samp}_quant
done



