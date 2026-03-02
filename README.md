# 6110_assignment_02

**RNASeq Differential Expression Analysis of Flor Yeast**  

Author: Maryanne Ogakwu  

Dataset: Flor Yeast - Madanov et al. 2020, Sec. Evolutionary and Genomic Microbiology

---
## Introduction
Sherry wine is a fortified wine from southern Spain that develops its distinctive character through biological aging, where a surface film of flor yeast grows on the wine in partially filled barrels (Niels 2023).   
Flor is a specialized form of _Saccharomyces cerevisiae_ that thrives after primary fermentation is complete, surviving in high alcohol and low nutrient conditions. As it forms a protective layer on the wine, flor continues to metabolize ethanol and other compounds, shaping the dry, nutty profile typical of biologically aged sherries like Fino and Manzanilla (Alexandre H. 2013 & Mardanov et al. 2023).  
The _Saccharomyces cerevisiae_ data set (Accession: PRJNA592304 ID: 592304) used in this bulk RNAseq analysis was adapted from a 2020 study titled "Transcriptome Profile of Yeast Strain Used for Biological Wine Aging Revealed Dynamic Changes of Gene Expression in Course of Flor Development" by Mardanov et al.

The study was applied to an RNAseq analysis for transcriptome analysis of the structural and functional changes industrial Flor yeast strain exhibited at different stages of velum formation during Sherry wine production. The study's experimental design involved monitoring gene expression levels and changes in gene expression at three stages: Early Biofilm formation, Thin Biofilm Formation and Mature Biofilm Formation. Samples were taken in biological replicates or three and analysed. 

This bulk RNAseq analysis will involve the transcript quantification, Differential Expression analysis, Functional Annotation and ORA/GSEA to determine the changes in gene expression from Early to Mature stages of flor formation.  

Salmon was chosen over full‑alignment tools like STAR or HISAT2 because its quasi‑mapping approach provides highly accurate transcript quantification with dramatically lower computational cost, making it ideal for bulk RNA‑seq workflows where alignment files are not required (Salmon documentation).  

DESeq2 was selected instead of edgeR or limma because it models count data using shrinkage‑based dispersion and fold‑change estimation, producing more stable and interpretable effect sizes for datasets with small numbers of replicates such as the three‑per‑stage design in this study (Liu et al 2021).  

ORA was used rather than GSEA because the goal of this analysis was to interpret clear sets of significantly up‑ and down‑regulated genes, and ORA is optimized for categorical DEG lists, whereas GSEA is better suited for subtle, rank‑based changes across the entire transcriptome (Plutobio 2025).


----
## Expected Results
Based on the results of the paper, Flor yeast is expected to undergo major metabolic reprogramming as it transitions from early biofilm to mature velum, shifting from sugar‑based glycolysis to ethanol and glycerol oxidation alongside increased mitochondrial activity and oxidative metabolism. This transition reflects adaptation to the nutrient‑poor, ethanol‑rich, oxygen‑limited environment at the wine surface, driving extensive rewiring of metabolism, stress‑response systems, and cell‑wall architecture in response to accumulating metabolic by‑products and oxidative stress.

The authors identified 1,490 differentially expressed genes, indicating a coordinated shift from a fermentative lifestyle to a respiratory, stress‑resistant, biofilm‑forming state. Key patterns included upregulation of oxidative metabolism, mitochondrial function, sulfur assimilation, protein quality control, and stress‑response pathways, along with downregulation of glycolysis, nutrient transporters, and growth‑associated functions. A striking feature was the strong induction of FLO11, the primary flocculin required for velum formation.

In line with the paper’s differential expression framework, the expected DEG patterns fall into four categories. Up2 genes should show moderate induction during the transition from early to thin biofilm, including oxidative‑stress responders and some amino‑acid transporters. Up4 genes are expected to be strongly induced in the mature biofilm, such as FLO11, mitochondrial and respiratory genes, sulfur‑assimilation genes, and protein‑quality‑control pathways. Dn2 genes should show moderate repression as nutrients decline, while Dn4 genes are expected to be strongly downregulated in the mature biofilm, particularly glycolytic enzymes, sugar transporters, and other fermentative‑metabolism pathways. These categories collectively reflect the yeast’s progression toward a respiratory, stress‑tolerant, biofilm‑forming phenotype.

Based on the paper, this bulk RNAseq differential expression analysis should reveal distinct signatures for each stage. Early biofilm is expected to show residual glycolysis, limited mitochondrial activity, and moderate stress responses. Thin biofilm should display increased expression of amino‑acid transporters and oxidative‑stress genes. Mature biofilm should show the strongest induction of FLO11, sulfur metabolism, mitochondrial genes, protein quality control, and DNA repair pathways, consistent with heightened oxidative and aldehyde stress. This stage is also expected to show increased heat‑shock proteins, chaperones, proteasome activity, and unfolded‑protein‑response genes, reflecting long term stress adaptation.
 

It is expected that the GO  enrichment will highlight oxidative phosphorylation, mitochondrial biogenesis, sulfur metabolism, protein folding, and stress‑response pathways among upregulated genes, and glycolysis, sugar transport, and amino‑acid transport among downregulated genes.

#### Differnetial Gene Expression Mature vs Early Biofilm Comparison
Below is a summarised list of the genes found in the study and the roles they played in biofilm production.

| Pathway | Up (n) | Example Up Genes | Down (n) | Example Down Genes | No Change (n) |
|----------|--------|------------------|----------|--------------------|---------------|
| Proteasome | 32 | PRE1, RPN9, RPT5, PRE6, UMP1 | 1 | BLM10 | 2 |
| Protein Export | 8 | KAR2, SEC61, SRP14, SBH2 | 1 | SPC1 | 13 |
| Vesicle Fusion | 4 | SED5, SEC9, SNC2 | 1 | VAM7 | 19 |
| UPR & ERAD | 27 | KAR2, PDI1, SSA1, HSP82, CDC48 | 13 | IRE1, USA1, SEC12, UFD2 | 46 |
| Autophagy | 15 | ATG8, ATG16, SNF1, PEP4 | 31 | TOR1, TOR2, ATG7, ATG5 | 38 |
| Mitophagy | 7 | ATG33, FIS1, MDM34 | 7 | ATG32, TOR1, TOR2 | 29 |
| DSB Repair | 5 | RAD54, RAD59, POL32 | 2 | TEL1, POL3 | 13 |
| DNA Replication | 2 | POL32, POL30 | 4 | MCM3, MCM4, POL3 | 25 |
| Mismatch Repair | 5 | EXO1, MSH3, POL30 | 1 | POL3 | 14 |
| Nucleotide Excision Repair | 6 | RAD23, POL30, TFB3 | 6 | RAD4, RAD1, SSL1 | 24 |
| Ribosome | 73 | RPL10, RPS3, RPL24a, RPS16a | 3 | RPS0b, RPL8a | 56 |
| Ribosome Biogenesis | 17 | NOP56, RIO1, UTP9, POP6 | 8 | NOG1, UTP22 | 46 |
| RNA Polymerase | 8 | RPB4, RPB11, RPC31 | 2 | RPO31, RPA190 | 19 |
| Basal Transcription Factors | 12 | TAF10, TAF8, SPT15, TFB3 | 3 | TAF2, SSL1 | 16 |
| Cell Cycle Regulators | 20 | CLN1, CLN2, CDC20, SWI5 | 19 | CLN3, MCM3, ORC1 | 87 |
----

## Methods
### 1. Data Acquisition 
Raw sequence reads _Saccharomyces cerevisiae_ related to the Flor yeast study (3 biofilm stages; Early, Thin, Mature biofilm, and 3 biological replicates of each stage) were downloaded from the NCBI Sequence Read Archive (Accession: PRJNA592304 ID: 592304) using SRA Toolkit (v3.3.0). Samples and their corresponding accenssion numbers:


| Sample |	Sample ID |	Stage |
| -------|-----------|-------|
| SRR10551665	| IL20 | Early biofilm |
| SRR10551664 |	IL21	| Early biofilm |
| SRR10551663	| IL22	| Early biofilm |
| SRR10551662	| IL23	| Thin biofilm |
| SRR10551661	| IL24	| Thin biofilm |
| SRR10551660 |	IL25 |	Thin biofilm |
| SRR10551659	| IL29	| Mature biofilm |
| SRR10551658	| IL30	| Mature biofilm |
| SRR10551657	| IL31	| Mature biofilm |

Based on recommendations by Liao and Shi (2020), adapter trimming was not performed prior to pseudo alignment quantification. Trimming is necessary when carrying out transcriptome assembly but not recommended to be done before gene expression quantification. Salmon, that was used for gene expression quantification can automatically soft-clip or ignore bad ends. So trimming is not necessary for this workflow.

### 2. Transcript Quantification
Transcript Quantification was performed using Salmon (v1.10.3) in mapping-based mode without full alignment (quasi mapping mode). A decoy aware transcriptome index was built from the _Saccharomyces cerevisiae_ S288C, NCBI RefSeq assembly GCF_000146045.2 using a k-mer length of  31. The index was built with the code below and each sample was quantified with the parameters below. Protocol for running salmon was adapted from Salmon documentation and Stony Brook University Combine-lab (2019) documentation.

```
salmon index \
-t gentrome.fa \
-d decoys.txt \
-i salmon_index \
-k 31

```
```
INDEX=salmon_index
THREADS=8

for fq in *_1.fastq
do
 base=$(basename ${fq} _1.fastq)
 salmon quant \
 -i salmon_index \
 -l A \
 -r ${fq} \
 -p ${THREADS} \
 -o ${base}_salmon \
 --seqBias \
 --useVBOpt \
 --validateMappings
done
```
Flag justification: 
Accuracy flags: 
~~~
-r flag is used  on single end reads.  
—seqBias corrects sequence specific bias in RNA-seq and improve abundance estimates.  
—useVBOpt uses variational Bayesian optimization to make abundance estimates more stable.  
— ValidateMappings enables selective alignment to reduce false mappings and improves mapping accuracy.
~~~
Transcript counts for each sample was imported into R using the tximport package (v1.36.1).

### 3. Differential Expression Analysis
Differential Expression Analysis was be performed using DESeq2 (v1.48.2) in R (v4.5.1). Raw count matrices were constructed from Salmon output using tximport.
```
txi <- tximport(joined.quants, type="salmon", tx2gene=tx2gene)
dds <- DESeqDataSetFromTximport(txi,
                                colData = sampleTable,
                                design = ~ Stage)
```
The sample data had the following groups:
- Intercept 
-  Stage_Mature.biofilm_vs_Early.biofilm
-  Stage_Thin.biofilm_vs_Early.biofilm
-  Stage_Thin.biofilm_vs_Mature.biofilm

### 4. Visualization of Data Structure
Overall data structure was assessed using models constructed with the apeglm package (v1.30.0) to determine gene expression changes across each stage using Heatmaps and PCA. Data was computed from variance-stabilizing transformed (VST) counts using the DESeq2 vst() function. Log₂ fold change shrinkage was applied using the apeglm method to obtain more accurate and stable effect size estimates, particularly for low-count genes. Shrinkage reduces exaggerated fold change estimates while preserving directionality, improving interpretability of downstream analyses such as heatmaps and functional enrichment.
```
res_mature <- results(dds,
                      contrast=c("Stage","Mature biofilm","Early biofilm"))

resLFC_mature <- lfcShrink(dds,
                    coef="Stage_Mature.biofilm_vs_Early.biofilm",
                    type="apeglm")
```
#### Heatmaps
Heatmaps were constructed from normalized count data, scaled by row to emphasize relative expression differences, with hierarchical clustering of both rows (genes) and columns (samples), and stage annotation included to visualize transcriptional patterns across biofilm development.   
```
pheatmap(mat,
         scale = "row",
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         annotation_col = annotation_df,
         show_rownames = FALSE,
         show_colnames = FALSE,
         fontsize = 8)
```
#### MA plot
MA plots were generated using DESeq2 to visualize the relationship between mean normalized expression (baseMean) and log₂ fold change for each gene. The x-axis represents the average normalized expression across samples, while the y-axis shows the log₂ fold change between biofilm stages. Differentially expressed genes were identified using Wald tests with Benjamini–Hochberg adjusted p-values (padj < 0.05). Both unshrunk and shrinkage-estimated log₂ fold changes (apeglm method) were examined to reduce variance inflation in low-count genes and improve effect size estimation.  
```
plotMA(res_mature,
       ylim=c(-2,2),
       main="Mature vs Early Unshrunk")

plotMA(resLFC_mature,
       ylim=c(-2,2),
       main="Mature vs Early Shrunk")
```
#### PCA
Principal Component Analysis (PCA) was performed on variance-stabilized transformed (VST) count data to assess global transcriptomic structure and sample clustering. PCA reduces high-dimensional gene expression data into orthogonal components that capture the largest sources of variance. The percentage of variance explained by each principal component was calculated, and samples were colored by biofilm stage to evaluate stage-specific clustering and replicate consistency.  
```
ggplot(pca_data,
       aes(x = PC1, y = PC2, color = Stage)) +
  geom_point(size = 6) +
  xlab(paste0("PC1: ", percentVar[1], "% variance")) +
  ylab(paste0("PC2: ", percentVar[2], "% variance")) +
  ggtitle("PCA Plot of Biofilm Stages") +
  theme_minimal() +
  theme(text = element_text(size = 14))
```
#### Volcano Plot
Volcano plots were constructed to visualize differential expression by plotting log₂ fold change on the x-axis against −log₁₀(adjusted p-value) on the y-axis. Genes with padj < 0.05 were considered statistically significant, and additional fold change thresholds (e.g., |log₂FC| > 1) were applied to highlight biologically meaningful expression changes. This visualization enables simultaneous assessment of effect size and statistical significance across all genes.
```
res_df_mature$significant <- ifelse(res_df_mature$padj < 0.05 &
                                  abs(res_df_mature$log2FoldChange) > 1,
                                ifelse(res_df_mature$log2FoldChange > 0,
                                       "Up", "Down"),
                                "Not Sig")
ggplot(res_df_mature, aes(x = log2FoldChange,
                      y = -log10(pvalue),
                      color = significant)) +
  geom_point() +
  scale_color_manual(values = c("Down"="blue",
                                "Not Sig"="gray",
                                "Up"="red")) +
  labs(title="Volcano Plot: Mature vs Early")
```

### 5. Functional Annotation - Over Representation Analysis (ORA)
Functional enrichment analysis was performed using Gene Ontology (GO) over-representation analysis (ORA) implemented in clusterProfiler. Significant genes (padj < 0.05) were separated into upregulated (log₂FC > 0) and downregulated (log₂FC < 0) groups for each comparison. Enrichment significance was calculated using hypergeometric testing with Benjamini–Hochberg correction (qvalue < 0.05). This analysis identifies biological processes that are statistically over-represented among differentially expressed genes relative to the genomic background.
```
ego_up_mature <- enrichGO(
  gene          = sig_up_mature,
  OrgDb         = org.Sc.sgd.db,
  keyType       = "ORF",   
  ont           = "BP",    
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05)

ego_down_mature <- enrichGO(
  gene          = sig_down_mature,
  OrgDb         = org.Sc.sgd.db,
  keyType       = "ORF",   
  ont           = "BP",    
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05)
```


---

## Results
**Statistical Tests and visualizations were carried out for each stage of the biofilm formation, namely: Mature vs Early, Mature vs Thin and Thin vs Early. The models discussed here (Mature vs Early) best reflect the gene expression changes from beginning to end of the biofilm formation, with exception of the PCA and Global Heatmap plots that are used to represent overall dataset structure and architechture. The extra plots and discussions of the plots can be found in the Figures directory and in the corresponding plot folders. These were not included in the README.md file for the sake of brevity.**


#### PCA for observing general data structure
<img width="1000" height="500" alt="PCA" src="https://github.com/user-attachments/assets/0f375481-7552-413c-bad9-e98c8b6b522a" />  

**Figure 1.** The plot shows a clear meaningful separation between the three biofilm stages.
The PCA plot shows strong separation between early, thin, and mature biofilm samples, with PC1 (71% variance) distinguishing early biofilm from the later stages and PC2 (24% variance) separating thin from mature biofilm. This indicates that each developmental stage has a distinct global transcriptomic profile.  
PC1 cleanly separates Early from Thin and Mature biofilm samples. This reflects the major metabolic shift away from glycolysis toward oxidative metabolism.  
PC2 separates Thin from Mature biofilm samples. This likely corresponds to the increasing activation of stress‑response, sulfur metabolism, and FLO11‑associated biofilm genes.  
The clear clustering reflects the major metabolic and stress‑response reprogramming described in the paper, supporting the expectation that differential expression analysis will reveal stage‑specific gene expression patterns.


#### Global Heatmap of changes in gene expression across all stages
<img width="1000" height="700" alt="Global heatmap across all stages" src="https://github.com/user-attachments/assets/e665fd3c-97ce-46b0-95d1-8e93418a9acc" />

**Figure 2.** The heatmap shows a clear stage‑dependent structure in gene expression that mirrors the PCA patterns. Early biofilm samples cluster together with high expression of glycolytic and growth‑related genes and low expression of mitochondrial and stress‑response genes. Thin biofilm samples form an intermediate group, showing partial activation of oxidative‑stress pathways and early reductions in nutrient‑transporter activity. Mature biofilm samples form a distinct cluster characterized by strong induction of FLO11‑linked adhesion genes, sulfur and mitochondrial pathways, and protein‑quality‑control systems, along with broad repression of glycolysis and transporter genes.

Hierarchical clustering reinforces these transitions, with large coordinated blocks of genes shifting from glycolytic and growth‑associated expression in early biofilm to oxidative, stress‑adapted, and adhesion‑related programs in the mature stage. This structured pattern highlights broad, systematic transcriptional reprogramming across stages and provides a strong foundation for the differential‑expression and functional‑enrichment analyses that follow.

#### MA Plot - Mature vs Early biofilm stages
<img width="1000" height="500" alt="MA Plot Mature vs Early Biofilm" src="https://github.com/user-attachments/assets/4ba3ac7b-3178-4077-8f9c-3628a9712fc8" />

**Figure 3.** The MA plots show a strong and widespread transcriptional shift between the two stages. In both the unshrunk and shrunk versions, a large number of genes deviate substantially from the horizontal baseline, indicating extensive differential expression. 
Genes with higher mean normalized counts show more stable fold‑change estimates, while genes with low counts display greater variability in the unshrunk plot.
Applying shrinkage reduces the extreme log fold‑change values for low‑abundance genes, pulling them toward zero and producing a more conservative and biologically interpretable distribution.
The clear vertical spread of points in both plots reflects the extensive transcriptional reprogramming that occurs as the biofilm transitions from early to mature stages, consistent with the PCA and heatmap results.

#### Volcano Plot - Mature vs Early Biofilm 

<img width="1000" height="600" alt="Volcano Plot Mature vs Early Biofilm" src="https://github.com/user-attachments/assets/94c38172-a1c5-47a7-8839-d1500282b510" />

**Figure 4.** This plot shows a strong and well‑defined differential expression signature, with a large number of genes exhibiting both high statistical significance and substantial fold‑change differences. Upregulated and downregulated genes form clear clusters on opposite sides of the plot, reflecting broad transcriptional shifts between the two stages. 
The wide horizontal spread indicates large magnitude changes in expression, while the tall vertical distribution demonstrates strong statistical support for these differences. This pattern highlights the transcriptional changes distinguishing mature from early biofilm samples.
These results help support findings in the paper.
Early biofilm cells rely on glycolysis and growth‑associated pathways, while mature biofilm cells adopt a respiratory, stress‑adapted, adhesion‑focused phenotype optimized for survival at the wine surface. The strong enrichment of upregulated stress‑response, mitochondrial, and sulfur‑metabolism genes in mature biofilm, paired with the repression of fermentative and nutrient‑responsive genes, visually confirms this metabolic and physiological transition.

### Over Representation Analysis

#### GO Enrichment of Upregulated genes - Mature vs Early biofilm
<img width="1200" height="800" alt="GO Mature vs Early upregulated genes" src="https://github.com/user-attachments/assets/bd073f63-d7d8-43d8-8852-b86c11d99fd5" />  

**Figure 5.** These results show a tightly connected set of processes centered on mitochondrial function, respiration, and protein quality control, capturing the core shift that defines mature biofilm physiology. Many of the most enriched categories involve mitochondrion organization, mitochondrial translation, respiratory chain complex assembly, and aerobic respiration, reflecting a strong activation of oxidative metabolism as cells transition away from the fermentative, growth‑oriented early stage. Additional terms related to protein folding, proteasomal protein catabolism, and modification‑dependent degradation highlight increased investment in maintaining proteome integrity under the stressful conditions. The repeated appearance of mitochondrial membrane and inner‑membrane organization terms reinforces the idea that mature biofilm cells undergo substantial remodeling of their respiratory machinery. 
Together, these results show that mature biofilm formation is driven by a coordinated upregulation of energy production, mitochondrial biogenesis, and protein‑quality‑control pathways that support long‑term survival and adhesion at the air–liquid interface.

#### GO Enrichment of Downregulated genes - Mature vs Early biofilm
<img width="1000" height="600" alt="GO Mature vs Early downregulated genes" src="https://github.com/user-attachments/assets/d411f477-2ac9-4b0a-87b9-badb9766284a" />

**Figure 6.** This plot forms a coherent picture of what the cell is turning off as it transitions from an early, growth‑oriented state to the fully developed mature velum. The enriched categories cluster around lipid metabolism, phosphorus and organophosphate metabolism, nucleotide turnover, transmembrane transport, and carbon‑processing pathways such as monocarboxylic acid and alcohol metabolism. These results indicate a broad suppression of biosynthetic activity, nutrient uptake, and energy intensive metabolic processes.
Early biofilm cells rely heavily on these pathways to support growth, membrane remodeling, and active resource acquisition, but mature biofilm cells downregulate them as they shift toward a slower‑growing, stress‑adapted, respiratory lifestyle. This coordinated decline in metabolic and transport functions aligns with the global transcriptomic reprogramming.




----

## Discussion

### Biological Implications of Transcriptomic changes 
Comparing mature and early biofilm stages reveals a coordinated reprogramming of cellular physiology as flor yeast transition from a growth‑oriented, fermentative state to a stress‑adapted, respiratory, and structurally stable velum. Early biofilm cells rely heavily on glycolysis, rapid nucleotide turnover, and high biosynthetic activity, consistent with the strong expression of genes involved in carbohydrate metabolism, nucleotide catabolism, and amino‑acid biosynthesis (Rather et al. 2021).  
In contrast, mature biofilm cells show extensive upregulation of mitochondrial organization, aerobic respiration, protein‑quality control, and membrane‑associated metabolic pathways. This shift reflects the metabolic demands of long‑term survival at the air–liquid interface, where oxidative stress, nutrient limitation, and structural stability become dominant selective pressures (Malviya et al. 2023).  
The gene‑level changes across proteasomal activity, UPR/ERAD, autophagy, mitophagy, DNA repair, ribosome biogenesis, and transcription collectively illustrate a developmental trajectory in which yeast cells progressively remodel their metabolism, proteostasis, and genome‑maintenance systems to support the mature velum phenotype (Barny & Plate 2025).

### Key Genes and Functional Annotation Underlying Transition
Several gene groups clearly define the shift from early to mature biofilm. The proteasomal system is strongly induced, with 32 subunits—including PRE1, PRE6, PRE8, RPN1, RPN5, RPN6, RPT2, RPT5, RPT6, and SEM1—upregulated, indicating enhanced protein‑degradation capacity (Taj et al. 2025).   
In the UPR/ERAD pathway, chaperones and folding factors such as KAR2, PDI1, SSE1, HSP82, and CDC48 increase in expression, while repression of IRE1, USA1, and CNE1 suggests a shift away from classical UPR signaling toward proteasome‑centered proteostasis (Mori 2024). 

Autophagy shows selective activation, with ATG8, ATG16, PEP4, and SNF1 upregulated but key regulators (ATG5, ATG7, ATG18, TOR1/TOR2) downregulated, reflecting targeted rather than global autophagy. Mitophagy genes such as FIS1, MDM34, and ATG33 are induced, supporting mitochondrial quality control, while downregulation of ATG32 points to a noncanonical mitophagy mode. Genes involved in DNA repair—including RAD54, RAD59, RDH54, and POL32—are upregulated, consistent with increased oxidative damage in mature biofilm (Bars et al. 2014 & Li et al. 2022) .   

The strongest signature appears in the ribosome, where 73 ribosomal proteins (e.g., RPL10, RPS22a, MRPS5) and several biogenesis factors (RIO1, NOP56, NOP58) are induced. Finally, transcriptional machinery is remodeled through upregulation of RNA polymerase subunits (RPB4, RPB11, RPA14) and basal transcription factors (TAF10, TAF12, SPT15), supporting increased production of stress‑response and mitochondrial proteins (Casamassimi et al. 2019)

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
- Alexandre H. (2013). Flor yeasts of Saccharomyces cerevisiae--their ecology, genetics and metabolism. International journal of food microbiology, 167(2), 269–275. https://doi.org/10.1016/j.ijfoodmicro.2013.08.021.

- Barny, L. A., & Plate, L. (2025). From stress to homeostasis: Mass spectrometry–based insights into the unfolded protein response (UPR) and proteostasis. Advances in Biological Regulation, 99, 101127. https://doi.org/10.1016/j.jbior.2025.101127.

- Bars, R. L., Marion, J., Borgne, R. L., Satiat-Jeunemaitre, B., & Bianchi, M. W. (2014). ATG5 defines a phagophore domain connected to the endoplasmic reticulum during autophagosome formation in plants. Nature Communications, 5(1), 4121. https://doi.org/10.1038/ncomms5121.

- Casamassimi, A., & Ciccodicola, A. (2019). Transcriptional Regulation: Molecules, Involved Mechanisms, and Misregulation. International journal of molecular sciences, 20(6), 1281. https://doi.org/10.3390/ijms20061281.

- Combine-lab (Stony Brook University). (2019). Selective alignment. https://combine-lab.github.io/alevin-tutorial/2019/selective-alignment/.

- Li, A., Gao, M., Liu, B. et al. Mitochondrial autophagy: molecular mechanisms and implications for cardiovascular disease. Cell Death Dis 13, 444 (2022). https://doi.org/10.1038/s41419-022-04906-6.

- Rather, M. A., Gupta, K., & Mandal, M. (2021). Microbial biofilm: formation, architecture, antibiotic resistance, and control strategies. Brazilian journal of microbiology : [publication of the Brazilian Society for Microbiology], 52(4), 1701–1718. https://doi.org/10.1007/s42770-021-00624-x.

- Salmon - Salmon 1.10.2 documentation. (n.d.). https://salmon.readthedocs.io/en/latest/salmon.html.

- Malviya, J., Alameri, A.A., Al-Janabi, S.S. et al. Metabolomic profiling of bacterial biofilm: trends, challenges, and an emerging antibiofilm target. World J Microbiol Biotechnol 39, 212 (2023). https://doi.org/10.1007/s11274-023-03651-y.

- Mardanov AV, Eldarov MA, Beletsky AV, Tanashchuk TN, Kishkovskaya SA and Ravin NV (2020) Transcriptome Profile of Yeast Strain Used for Biological Wine Aging Revealed Dynamic Changes of Gene Expression in Course of Flor Development. Front. Microbiol. 11:538. doi: 10.3389/fmicb.2020.00538.

- Mardanov, A. V., Gruzdev, E. V., Beletsky, A. V., Ivanova, E. V., Shalamitskiy, M. Y., Tanashchuk, T. N., & Ravin, N. V. (2023). Microbial Communities of Flor Velums and the Genetic Stability of Flor Yeasts Used for a Long Time for the Industrial Production of Sherry-like Wines. Fermentation, 9(4), 367. https://doi.org/10.3390/fermentation9040367.

- Mori K. (2024). Elucidation of molecular mechanism of the unfolded protein response. The Keio journal of medicine, 73(1), 13. https://doi.org/10.2302/kjm.ABSTRACT_73_1-2.

- Niels. (2023, August 31). Sherry flor. Bodegas Lustau. https://lustau.es/en/blog/sherry-flor-the-veil-of-flor-and-what-is-flor-used-for-in-sherry/?utm_source=copilot.com.

- Patro, R., Duggal, G., Love, M. et al. (2017). Salmon provides fast and bias-aware quantification of transcript expression. Nat Methods 14, 417–419. https://doi.org/10.1038/nmeth.4197.

- Taj, Z., Rani, S.S., Gundamaraju, R., Chattopadhyay, I. (2025). Genomic Insights into the Field of Biofilm Research. In: Busi, S., Pattnaik, S., Prasad, R. (eds) Omics Approaches in Biofilm Research. Springer, Cham. https://doi.org/10.1007/978-3-031-91863-6_5.

- Yang Liao, Wei Shi, Read trimming is not required for mapping and quantification of RNA-seq reads at the gene level, NAR Genomics and Bioinformatics, Volume 2, Issue 3, September 2020, lqaa068, https://doi.org/10.1093/nargab/lqaa068.
  
- Liu, S., Wang, Z., Zhu, R., Wang, F., Cheng, Y., Liu, Y. Three Differential Expression Analysis Methods for RNA Sequencing: limma, EdgeR, DESeq2. J. Vis. Exp. (175), e62528, doi:10.3791/62528 (2021).
  
- Pluto Bio • GSEA vs ORA: Two key pathway analysis approach. . . | Pluto Bio. (2025). https://pluto.bio/resources/Learning%20Series/gsea-vs-ora-two-key-pathway-analysis-approaches-for-next-gen-sequencing-data
