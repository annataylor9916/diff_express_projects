# Differential Gene Expression, Pathway & Splicing Analysis (MSc Projects)

1. Differential gene expression analysis of Venetoclax-resistant mantle cell lymphoma cell line transcriptome 

- The data analysed as part of this exercised comes from Zhao et al. 2019 (10.1016/j.ccell.2019.04.005); raw data can be downloaded here:   https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE116132.
- As part of this project, derived/resistant cell line J4 was compared to parental cell line to investigate the mechanisms of Venetoclax resistance
- QC, trimming, and quantification were performed on a university HPC cluster with the use of fastQC, TrimGalore, and salmon respectively. Resulting .sf files are included in Files1 (derived samples), and Files2 (parental samples) and are ready for downstream analysis. Bash script used to create them is also included.

2. Differential gene expression, gene ontology and splicing analysis of blood transcriptome bulk RNA-seq data to uncover dysregulation patterns in individual with neurological spectrum disorder

Analysed data included both short- and long-read samples. The workflow does not include QC, trimming, alignment, or quantification steps for which fastQC, cutadapt, STAR, and featureCounts were used respectively. Splicing patterns were also analysed in a HPC environment using rMATS which resulted in a txt file for downstream analysis in R.





