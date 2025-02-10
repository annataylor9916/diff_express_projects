# Differential Gene Expression, Pathway & Splicing Analysis (MSc Projects)


1) Differential gene expression analysis of Venetoclax-resistant mantle cell lymphoma cell line transcriptome 
The data analysed as part of this exercised comes from Zhao et al. 2019 (10.1016/j.ccell.2019.04.005); the raw data can be downloaded here: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE116132. This workflow does not include QC, trimming, or quantification steps, but fastQC, TrimGalore, and salmon were used for this respectively.

2) Differential gene expression, gene ontology and splicing analysis of blood transcriptome bulk RNA-seq data to uncover dysregulation patterns in individual with neurological spectrum disorder
Analysed data included both short- and long-read samples. The workflow does not include QC, trimming, alignment, or quantification steps for which fastQC, cutadapt, STAR, and featureCounts were used respectively. Splicing patterns were also analysed in a HPC environment using rMATS which resulted in a txt file for downstream analysis in R.





