# 6110_assignment_02

**RNASeq Differential Expression Analysis of Flor Yeast**
Maryanne Ogakwu
Dataset: Flor Yeast - Madanov et al. 2020, Sec. Evolutionary and Genomic Microbiology

---
## Introduction
The _Saccharomyces cerevisiae_ data set (Accession: PRJNA592304 ID: 592304) used in this bulk RNAseq analysis was adapted from a 2020 study titled "Transcriptome Profile of Yeast Strain Used for Biological Wine Aging Revealed Dynamic Changes of Gene Expression in Course of Flor Development" by Mardanov et al.

The study was applied to an RNAseq analysis for transcriptome analysis of the structural and functional changes industrial Flor yeast strain exhibited at different stages of velum formation during Sherry wine production. The study's experimental design involved monitoring gene expression levels and changes in gene expression at three stages: Early Biofilm formation, Thin Biofilm Formation and Mature Biofilm Formation. Samples were taken in biological replicates or three and analysed. 

This bulk RNAseq analysis will involve the transcript quantification, Differential Expression analysi, Functional Annotation and ORA/GSEA to detremine the changes in gene expression from Early to Mature stages of flor formation.

----

## Methods

---

## Results

----

## Discussion

---
## Conclusion

---
## Dependencies and Packages
| Tool | Version | Source | Purpose |
|------|---------|--------|---------|
| SRA Toolkit | 3.3.0 | NCBI | Raw data download |
| Salmon | 1.10.3 | COMBINE-lab |Transcript quantification |
| R | 4.5.1 | CRAN | Statistical analysis |
| DESeq2 | 1.48.2 | BioC 3.21 |Differential expression |
| tximport | 1.36.1 | BioC 3.21 | Count matrix import |
| pheatmap | 1.0.13 | CRAN | Heatmap visualization |
| ggplot2 | v4.0.2 | CRAN |General visualization |
| org.Sc.sgd.db | 3.21.0 | Bioconductor | Genome Wide Annotation for Yeast|
| readr | 2.2.0 | CRAN | Reading data |
| rtracklayer | 1.68.0 | BioC 3.21| R interface to Genome Annotation files |
| apeglm | 1.30.0 | BioC 3.21 | GLM models for Statistics |


## References
Combine-lab (Stony Brook University). (2019, October 30). Selective alignment. https://combine-lab.github.io/alevin-tutorial/2019/selective-alignment/

Salmon - Salmon 1.10.2 documentation. (n.d.). https://salmon.readthedocs.io/en/latest/salmon.html

Patro, R., Duggal, G., Love, M. et al. Salmon provides fast and bias-aware quantification of transcript expression. Nat Methods 14, 417–419 (2017). https://doi.org/10.1038/nmeth.4197

##
