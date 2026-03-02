# 6110_assignment_02

**RNASeq Differential Expression Analysis of Flor Yeast**
Maryanne Ogakwu
Dataset: Flor Yeast - Madanov et al. 2020, Sec. Evolutionary and Genomic Microbiology

---
## Introduction
Sherry wine is a fortified wine from southern Spain that develops its distinctive character through biological aging, where a surface film of flor yeast grows on the wine in partially filled barrels *Niels*.   
Flor is a specialized form of Saccharomyces cerevisiae that thrives after primary fermentation is complete, surviving in high alcohol and low nutrient conditions. As it forms a protective layer on the wine, flor continues to metabolize ethanol and other compounds, shaping the dry, nutty profile typical of biologically aged sherries like Fino and Manzanilla *Alexandra and Mardano* .
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

### Biological Implications of Transcriptomic changes 
Comparing mature and early biofilm stages reveals a coordinated reprogramming of cellular physiology as flor yeast transition from a growth‑oriented, fermentative state to a stress‑adapted, respiratory, and structurally stable velum. Early biofilm cells rely heavily on glycolysis, rapid nucleotide turnover, and high biosynthetic activity, consistent with the strong expression of genes involved in carbohydrate metabolism, nucleotide catabolism, and amino‑acid biosynthesis *Rather*.  
In contrast, mature biofilm cells show extensive upregulation of mitochondrial organization, aerobic respiration, protein‑quality control, and membrane‑associated metabolic pathways. This shift reflects the metabolic demands of long‑term survival at the air–liquid interface, where oxidative stress, nutrient limitation, and structural stability become dominant selective pressures *Maliviya*.  
The gene‑level changes across proteasomal activity, UPR/ERAD, autophagy, mitophagy, DNA repair, ribosome biogenesis, and transcription collectively illustrate a developmental trajectory in which yeast cells progressively remodel their metabolism, proteostasis, and genome‑maintenance systems to support the mature velum phenotype *Barny*.

### Key Genes and Functional Annotation Underlying Transition
Several gene groups clearly define the shift from early to mature biofilm. The proteasomal system is strongly induced, with 32 subunits—including PRE1, PRE6, PRE8, RPN1, RPN5, RPN6, RPT2, RPT5, RPT6, and SEM1—upregulated, indicating enhanced protein‑degradation capacity*Taj*.   
In the UPR/ERAD pathway, chaperones and folding factors such as KAR2, PDI1, SSE1, HSP82, and CDC48 increase in expression, while repression of IRE1, USA1, and CNE1 suggests a shift away from classical UPR signaling toward proteasome‑centered proteostasis *Mori*. 

Autophagy shows selective activation, with ATG8, ATG16, PEP4, and SNF1 upregulated but key regulators (ATG5, ATG7, ATG18, TOR1/TOR2) downregulated, reflecting targeted rather than global autophagy. Mitophagy genes such as FIS1, MDM34, and ATG33 are induced, supporting mitochondrial quality control, while downregulation of ATG32 points to a noncanonical mitophagy mode. Genes involved in DNA repair—including RAD54, RAD59, RDH54, and POL32—are upregulated, consistent with increased oxidative damage in mature biofilm *Bars & Li*.   

The strongest signature appears in the ribosome, where 73 ribosomal proteins (e.g., RPL10, RPS22a, MRPS5) and several biogenesis factors (RIO1, NOP56, NOP58) are induced. Finally, transcriptional machinery is remodeled through upregulation of RNA polymerase subunits (RPB4, RPB11, RPA14) and basal transcription factors (TAF10, TAF12, SPT15), supporting increased production of stress‑response and mitochondrial proteins *Casamassimi*.

### Implications of Gene Expression Changes in the Biofilm Physiology
The expression changes observed across these pathways collectively explain how flor yeast achieve the mature velum phenotype. Upregulation of proteasomal and ERAD components enhances the cell’s ability to remove damaged proteins, a critical adaptation to oxidative stress. Increased expression of ribosomal proteins and RNA‑polymerase subunits supports the synthesis of mitochondrial and stress‑response proteins required for sustained respiration.   
Selective activation of autophagy and mitophagy genes ensures organelle quality control without triggering energy‑intensive bulk degradation, aligning with the reduced TOR signaling seen in the downregulation of TOR1, TOR2, and SCH9.   
Suppression of DNA replication genes (MCM3, MCM4, PRI2, POL3) and cell‑cycle regulators indicates a shift toward slow proliferation, while upregulation of DNA‑repair genes ensures genome stability under oxidative conditions.   
These changes show that mature biofilm cells prioritize proteostasis, mitochondrial function, and genome maintenance over growth and division. This integrated remodeling enables the formation of a stable, long‑lived biofilm capable of surviving the nutrient‑poor, oxygen‑rich wine surface.


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
Alexandre H. (2013). Flor yeasts of Saccharomyces cerevisiae--their ecology, genetics and metabolism. International journal of food microbiology, 167(2), 269–275. https://doi.org/10.1016/j.ijfoodmicro.2013.08.021

Barny, L. A., & Plate, L. (2025). From stress to homeostasis: Mass spectrometry–based insights into the unfolded protein response (UPR) and proteostasis. Advances in Biological Regulation, 99, 101127. https://doi.org/10.1016/j.jbior.2025.101127

Bars, R. L., Marion, J., Borgne, R. L., Satiat-Jeunemaitre, B., & Bianchi, M. W. (2014). ATG5 defines a phagophore domain connected to the endoplasmic reticulum during autophagosome formation in plants. Nature Communications, 5(1), 4121. https://doi.org/10.1038/ncomms5121

Casamassimi, A., & Ciccodicola, A. (2019). Transcriptional Regulation: Molecules, Involved Mechanisms, and Misregulation. International journal of molecular sciences, 20(6), 1281. https://doi.org/10.3390/ijms20061281

Combine-lab (Stony Brook University). (2019). Selective alignment. https://combine-lab.github.io/alevin-tutorial/2019/selective-alignment/

Li, A., Gao, M., Liu, B. et al. Mitochondrial autophagy: molecular mechanisms and implications for cardiovascular disease. Cell Death Dis 13, 444 (2022). https://doi.org/10.1038/s41419-022-04906-6

Rather, M. A., Gupta, K., & Mandal, M. (2021). Microbial biofilm: formation, architecture, antibiotic resistance, and control strategies. Brazilian journal of microbiology : [publication of the Brazilian Society for Microbiology], 52(4), 1701–1718. https://doi.org/10.1007/s42770-021-00624-x

Salmon - Salmon 1.10.2 documentation. (n.d.). https://salmon.readthedocs.io/en/latest/salmon.html

Malviya, J., Alameri, A.A., Al-Janabi, S.S. et al. Metabolomic profiling of bacterial biofilm: trends, challenges, and an emerging antibiofilm target. World J Microbiol Biotechnol 39, 212 (2023). https://doi.org/10.1007/s11274-023-03651-y

Mardanov, A. V., Gruzdev, E. V., Beletsky, A. V., Ivanova, E. V., Shalamitskiy, M. Y., Tanashchuk, T. N., & Ravin, N. V. (2023). Microbial Communities of Flor Velums and the Genetic Stability of Flor Yeasts Used for a Long Time for the Industrial Production of Sherry-like Wines. Fermentation, 9(4), 367. https://doi.org/10.3390/fermentation9040367

Mori K. (2024). Elucidation of molecular mechanism of the unfolded protein response. The Keio journal of medicine, 73(1), 13. https://doi.org/10.2302/kjm.ABSTRACT_73_1-2

Niels. (2023, August 31). Sherry flor. Bodegas Lustau. https://lustau.es/en/blog/sherry-flor-the-veil-of-flor-and-what-is-flor-used-for-in-sherry/?utm_source=copilot.com

Patro, R., Duggal, G., Love, M. et al. (2017). Salmon provides fast and bias-aware quantification of transcript expression. Nat Methods 14, 417–419. https://doi.org/10.1038/nmeth.4197

Taj, Z., Rani, S.S., Gundamaraju, R., Chattopadhyay, I. (2025). Genomic Insights into the Field of Biofilm Research. In: Busi, S., Pattnaik, S., Prasad, R. (eds) Omics Approaches in Biofilm Research. Springer, Cham. https://doi.org/10.1007/978-3-031-91863-6_5

