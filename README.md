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
## Expected Results
Based on the results of the paper, Flor yeast is expected to undergo major metabolic reprogramming as it transitions from early biofilm to mature velum, shifting from sugar‑based glycolysis to ethanol and glycerol oxidation alongside increased mitochondrial activity and oxidative metabolism. This transition reflects adaptation to the nutrient‑poor, ethanol‑rich, oxygen‑limited environment at the wine surface, driving extensive rewiring of metabolism, stress‑response systems, and cell‑wall architecture in response to accumulating metabolic by‑products and oxidative stress.

The authors identified 1,490 differentially expressed genes, indicating a coordinated shift from a fermentative lifestyle to a respiratory, stress‑resistant, biofilm‑forming state. Key patterns included upregulation of oxidative metabolism, mitochondrial function, sulfur assimilation, protein quality control, and stress‑response pathways, along with downregulation of glycolysis, nutrient transporters, and growth‑associated functions. A striking feature was the strong induction of FLO11, the primary flocculin required for velum formation.

In line with the paper’s differential expression framework, the expected DEG patterns fall into four categories. Up2 genes should show moderate induction during the transition from early to thin biofilm, including oxidative‑stress responders and some amino‑acid transporters. Up4 genes are expected to be strongly induced in the mature biofilm, such as FLO11, mitochondrial and respiratory genes, sulfur‑assimilation genes, and protein‑quality‑control pathways. Dn2 genes should show moderate repression as nutrients decline, while Dn4 genes are expected to be strongly downregulated in the mature biofilm, particularly glycolytic enzymes, sugar transporters, and other fermentative‑metabolism pathways. These categories collectively reflect the yeast’s progression toward a respiratory, stress‑tolerant, biofilm‑forming phenotype.

Based on the paper, this bulk RNAseq differential expression analysis should reveal distinct signatures for each stage. Early biofilm is expected to show residual glycolysis, limited mitochondrial activity, and moderate stress responses. Thin biofilm should display increased expression of amino‑acid transporters and oxidative‑stress genes. Mature biofilm should show the strongest induction of FLO11, sulfur metabolism, mitochondrial genes, protein quality control, and DNA repair pathways, consistent with heightened oxidative and aldehyde stress. This stage is also expected to show increased heat‑shock proteins, chaperones, proteasome activity, and unfolded‑protein‑response genes, reflecting long term stress adaptation.
 

It is expected that the GO  enrichment will highlight oxidative phosphorylation, mitochondrial biogenesis, sulfur metabolism, protein folding, and stress‑response pathways among upregulated genes, and glycolysis, sugar transport, and amino‑acid transport among downregulated genes.

----

## Methods

---

## Results

----

## Discussion

---
## Conclusion
The results observed in the original paper and results from this bulk RNA seq analysis show a clear, staged progression in flor‑yeast biofilm development, moving from a fermentative, growth‑oriented early state to a metabolically reprogrammed thin stage and finally to the fully oxidative, stress‑adapted mature velum.  

Across PCA, MA plots, volcano plots, and GO enrichment analyses, early biofilm is defined by high glycolytic activity, rapid carbon and nucleotide turnover, and strong biosynthetic demand. As cells transition into the thin biofilm, they begin upregulating translation, ribosome biogenesis, amino‑acid synthesis, and early mitochondrial functions, marking a dynamic intermediate phase where metabolic capacity expands and respiratory pathways begin to activate. The mature biofilm stage completes this shift, showing strong induction of mitochondrial organization, aerobic respiration, protein‑quality‑control pathways, and extensive remodeling of membrane and metabolic processes, while simultaneously downregulating growth‑associated, nutrient‑responsive, and catabolic pathways.  

Together, these results depict biofilm development as a coordinated metabolic and structural reprogramming trajectory, culminating in a mature state optimized for long‑term survival at the air–liquid interface.

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
| clusterProfiler | 4.16.0 | BioC 3.21 | GO enrichment ORA |


## References
Combine-lab (Stony Brook University). (2019). Selective alignment. https://combine-lab.github.io/alevin-tutorial/2019/selective-alignment/

Salmon - Salmon 1.10.2 documentation. (n.d.). https://salmon.readthedocs.io/en/latest/salmon.html

Patro, R., Duggal, G., Love, M. et al. (2017). Salmon provides fast and bias-aware quantification of transcript expression. Nat Methods 14, 417–419. https://doi.org/10.1038/nmeth.4197

##
