# ------------------------ Packages used --------------------------
library("DESeq2")
library("tximport")
library(ggplot2)
library(readr)
library(rtracklayer)
library(apeglm)
library(pheatmap)
library(clusterProfiler)
library(org.Sc.sgd.db)

#------------------------- Load metadata -------------------------
sampleTable <- read.table("metadata.txt",
                      header = TRUE,
                      sep = "\t",
                      stringsAsFactors = FALSE)

head(sampleTable)

# ----------- Load quant files generated with salmon  --------------
#Merging all 9 generated quantification files into one single count matrix
list.files("quants")
joined.quants <- file.path("quants",
                   paste0(sampleTable$Sample, "_quant.sf"))

names(joined.quants) <- sampleTable$Sample

joined.quants
file.exists(joined.quants)

#----------- Load the tx2gene file (gtf file) ------------
#Generating the txgene file from the gtf annotation file
library(rtracklayer)
getwd()
gtf <- import("GCF_000146045.2_genomic.gtf")

#Extract transcript to get gene mapping
tx2gene <- as.data.frame(gtf[gtf$type == "transcript", 
                             c("transcript_id","gene_id")])
head(tx2gene)
#Still Contains genomic columns
tx2gene <- unique(tx2gene[, c("transcript_id","gene_id")])

#Saving the tx2gene data to a table
write.table(tx2gene,
            file="tx2gene.txt",
            sep="\t",
            quote=FALSE,
            row.names=FALSE,
            col.names=FALSE)
rm(tx2gene_clean)

#--------------- Import Salmon results with tximport -------------------

txi <- tximport(joined.quants, type="salmon", tx2gene=tx2gene)
dim(txi$counts)
#---------------   DESeq2 ---------------------

dds <- DESeqDataSetFromTximport(txi,
                                colData = sampleTable,
                                design = ~ Stage)

#Checking whether the "Early Biofilm" is the reference level 
levels(dds$Stage)

dds <- DESeq(dds)

#Checking and comparing the names
resultsNames(dds)

# ------------------                 --------------------
#There are 3 stages of gene expression we need to compare, so we will be comparing the reference level ("Early biofilm") to the "Thin biofilm" and "Mature biofilm" levels.

#Since it is a 3 condition experiment, I will be using contrast to  control for the comparisons I want to make 

#Comparing Thin biofilm vs Early biofilm to represent changes that occured from the beginning of the study to the intermediate stages.
res_thin <- results(dds,
                    contrast=c("Stage","Thin biofilm","Early biofilm"))

#Taking a look at the Thin vs Early results table
res_thin
#Shrinking
resLFC_thin <- lfcShrink(dds,
                    coef="Stage_Thin.biofilm_vs_Early.biofilm",
                    type="apeglm")

#Comparing Mature biofilm vs Early Biofilm to represent changes that occured in the duration of the study
res_mature <- results(dds,
                      contrast=c("Stage","Mature biofilm","Early biofilm"))

#Taking a look at the Mature vs Early results table
res_mature
#Shrinking
resLFC_mature <- lfcShrink(dds,
                    coef="Stage_Mature.biofilm_vs_Early.biofilm",
                    type="apeglm")
#Comparing Thin biofilm vs Mature biofilm to represent changes that occured from the intermediate stage to the last stage
res_inter <- results(dds,
                      contrast=c("Stage","Thin biofilm","Mature biofilm"))

#Taking a look at the Thin vs Early results table
res_inter
#Shrinking
resLFC_inter <- lfcShrink(dds,
                          contrast=c("Stage",
                                     "Thin biofilm",
                                     "Mature biofilm"),
                          type="normal")

# -----------------------  MA Plots ----------------------

#Plotting Thin vs Early stages shrunk and unshrunk side by side to view changes shrinking makes.
par(mfrow=c(1,2))   # 1 row, 2 columns

plotMA(res_thin,
       ylim=c(-2,2),
       main="Thin vs Early Unshrunk")

plotMA(resLFC_thin,
       ylim=c(-2,2),
       main="Thin vs Early Shrunk")
# reset layout
par(mfrow=c(1,1))
#Plotting Mature vs Early  stages shrunk and unshrunk side by side to view changes shrinking makes.
par(mfrow=c(1,2))   # 1 row, 2 columns

plotMA(res_mature,
       ylim=c(-2,2),
       main="Mature vs Early Unshrunk")

plotMA(resLFC_mature,
       ylim=c(-2,2),
       main="Mature vs Early Shrunk")
# reset layout
par(mfrow=c(1,1))

#Plotting Thin vs Mature stages shrunk and unshrunk side by side to view changes shrinking makes.
par(mfrow=c(1,2))   # 1 row, 2 columns

plotMA(res_inter,
       ylim=c(-2,2),
       main="Thin vs Mature Unshrunk")

plotMA(resLFC_inter,
       ylim=c(-2,2),
       main="Thin vs Mature Shrunk")
# reset layout
par(mfrow=c(1,1))

# -------------------- Volcano Plots ----------------------
#Marking genes that are observed as upregulated, downregulated, and not significant 
#We'll also exclude genes with under 2-fold change (log2FoldChange < 1)

#Thin vs Early volcano plot
res_df_thin <- as.data.frame(resLFC_thin)
res_df_thin$gene <- rownames(res_df_thin)

res_df_thin$significant <- ifelse(res_df_thin$padj < 0.05 &
                                  abs(res_df_thin$log2FoldChange) > 1,
                                ifelse(res_df_thin$log2FoldChange > 0,
                                       "Up", "Down"),
                                "Not Sig")

res_df_thin <- na.omit(res_df_thin)

ggplot(res_df_thin, aes(x = log2FoldChange,
                   y = -log10(pvalue),
                   color = significant)) +
  geom_point() +
  scale_color_manual(values = c("Down"="blue",
                                "Not Sig"="gray",
                                "Up"="red")) +
  labs(title="Volcano Plot: Thin vs Early")

#Mature vs Early volcano plot
res_df_mature <- as.data.frame(resLFC_mature)
res_df_mature$gene <- rownames(res_df_mature)

res_df_mature$significant <- ifelse(res_df_mature$padj < 0.05 &
                                  abs(res_df_mature$log2FoldChange) > 1,
                                ifelse(res_df_mature$log2FoldChange > 0,
                                       "Up", "Down"),
                                "Not Sig")

res_df_mature <- na.omit(res_df_mature)

ggplot(res_df_mature, aes(x = log2FoldChange,
                      y = -log10(pvalue),
                      color = significant)) +
  geom_point() +
  scale_color_manual(values = c("Down"="blue",
                                "Not Sig"="gray",
                                "Up"="red")) +
  labs(title="Volcano Plot: Mature vs Early")

#Thin vs Mature volcano plot
res_df_inter <- as.data.frame(resLFC_inter)
res_df_inter$gene <- rownames(res_df_inter)

res_df_inter$significant <- ifelse(res_df_inter$padj < 0.05 &
                                  abs(res_df_inter$log2FoldChange) > 1,
                                ifelse(res_df_inter$log2FoldChange > 0,
                                       "Up", "Down"),
                                "Not Sig")

res_df_inter <- na.omit(res_df_inter)

ggplot(res_df_inter, aes(x = log2FoldChange,
                      y = -log10(pvalue),
                      color = significant)) +
  geom_point() +
  scale_color_manual(values = c("Down"="blue",
                                "Not Sig"="gray",
                                "Up"="red")) +
  labs(title="Volcano Plot: Thin vs Mature")

# --------------- Global Biofilm Progression Heatmap -----------------
# Remove NA values
resLFC_thin <- na.omit(resLFC_thin)
resLFC_mature <- na.omit(resLFC_mature)
resLFC_inter <- na.omit(resLFC_inter)

#This is to represent the changes in gene expression across all stages of the biofilm growth. I'll be zooming in to get a better idea for each stage.
sig1 <- rownames(resLFC_thin[resLFC_thin$padj < 0.05, ])
sig2 <- rownames(resLFC_mature[resLFC_mature$padj < 0.05, ])
sig3 <- rownames(resLFC_inter[resLFC_inter$padj < 0.05, ])
#Because the purpose of that heatmap is to capture all biologically responsive genes, show global clustering and avoid artificially shrinking the gene set. So adding a log2FC cutoff would remove moderate but real stage-transition genes and distort the progression pattern.
#For a global progression heatmap, some moderate shifts are biologically meaningful

gene_names <- unique(c(sig1, sig2, sig3))

#Variance stabilizing transformation
vsd <- vst(dds, blind = FALSE)

#Extract expression matrix for significant genes
mat <- assay(vsd)[gene_names, ]

# Remove genes with zero variance
mat <- mat[apply(mat, 1, var) != 0, ]

#Create annotation dataframe
annotation_df <- data.frame(Stage = sampleTable$Stage)
rownames(annotation_df) <- sampleTable$Sample
annotation_df$Stage <- as.factor(annotation_df$Stage)

#Check alignment
all(rownames(annotation_df) == colnames(mat))

#Generate a Global biofilm preogression heatmap
pheatmap(mat,
         scale = "row",
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         annotation_col = annotation_df,
         show_rownames = FALSE,
         show_colnames = FALSE,
         fontsize = 8)

# -------------- Biofilm Heatmap for different stages --------
#Thin vs Early
sig_thin <- rownames(resLFC_thin[
  resLFC_thin$padj < 0.05 &
    abs(resLFC_thin$log2FoldChange) > 1,
])
#Variance Sabilising Transformation
vsd <- vst(dds, blind = FALSE)

#Extracting Expression Matrix
mat_thin <- assay(vsd)[sig_thin, ]

#Top 30 genes
top_genes_thin <- head(order(resLFC_thin$padj), 20)
gene_names_thin <- rownames(resLFC_thin)[top_genes_thin]

mat_thin <- assay(vsd)[gene_names_thin, ]

#Remove zero variance genes 
mat_thin <- mat_thin[apply(mat_thin, 1, var) != 0, ]

#I'll use the same Stage Annotation Labels I created earlier for the global heatmap
#Checking row names
all(rownames(annotation_df) == colnames(mat_thin))

#***************************************************************
#Heatmap for Thin vs Early
pheatmap(mat_thin,
         scale = "row",
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         annotation_col = annotation_df,
         show_rownames = TRUE,      # ← labeled genes
         show_colnames = FALSE,
         fontsize_row = 8,
         fontsize = 10,
         main = "Differentially Expressed Genes: Thin vs Early2")

#***************************************************************
#Mature vs Early
sig_mature <- rownames(resLFC_mature[
  resLFC_mature$padj < 0.05 &
    abs(resLFC_mature$log2FoldChange) > 1,
])
#Variance Sabilising Transformation
vsd <- vst(dds, blind = FALSE)

#Extracting Expression Matrix
mat_mature <- assay(vsd)[sig_mature, ]

#Top 30 genes
top_genes_mature <- head(order(resLFC_mature$padj), 20)
gene_names_mature <- rownames(resLFC_mature)[top_genes_mature]

mat_mature <- assay(vsd)[gene_names_mature, ]

#Remove zero variance genes 
mat_mature <- mat_mature[apply(mat_mature, 1, var) != 0, ]

#I'll use the same Stage Annotation Labels I created earlier for the global heatmap
#Checking row names
all(rownames(annotation_df) == colnames(mat_mature))

#Heatmap for Mature vs Early
pheatmap(mat_mature,
         scale = "row",
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         annotation_col = annotation_df,
         show_rownames = TRUE,      
         show_colnames = FALSE,
         fontsize_row = 8,
         fontsize = 10,
         main = "Differentially Expressed Genes: Mature vs Early")


#*****************************************************
#Thin vs Mature
sig_inter <- rownames(resLFC_inter[
  resLFC_inter$padj < 0.05 &
    abs(resLFC_inter$log2FoldChange) > 1,
])
#Variance Sabilising Transformation
vsd <- vst(dds, blind = FALSE)

#Extracting Expression Matrix
mat_inter <- assay(vsd)[sig_inter, ]

#Top 30 genes
top_genes_inter <- head(order(resLFC_inter$padj), 20)
gene_names_inter <- rownames(resLFC_inter)[top_genes_inter]

mat_inter <- assay(vsd)[gene_names_inter, ]

#Remove zero variance genes 
mat_inter <- mat_inter[apply(mat_thin, 1, var) != 0, ]

#I'll use the same Stage Annotation Labels I created earlier for the global heatmap
#Checking row names
all(rownames(annotation_df) == colnames(mat_inter))

#Heatmap for Thin vs Early
pheatmap(mat_inter,
         scale = "row",
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         annotation_col = annotation_df,
         show_rownames = TRUE,     
         show_colnames = FALSE,
         fontsize_row = 8,
         fontsize = 10,
         main = "Differentially Expressed Genes: Thin vs Mature")

# ----------------------------- PCA --------------------------
#The PCA plot will be based on the Variant Stabilised transformed data to represent the progression of the biofilm stages
pca_data <- plotPCA(vsd,
                    intgroup = "Stage",
                    returnData = TRUE)

#Extracting and formatting information about how much variation each principal component explains
percentVar <- round(100 * attr(pca_data, "percentVar"))
#Checking the attribute
attr(pca_data, "percentVar")
#This gave:  0.7143245 0.2363471, Indicating that PC1 is about 71% of the total variance and PC2 is about 20%

ggplot(pca_data,
       aes(x = PC1, y = PC2, color = Stage)) +
  geom_point(size = 6) +
  xlab(paste0("PC1: ", percentVar[1], "% variance")) +
  ylab(paste0("PC2: ", percentVar[2], "% variance")) +
  ggtitle("PCA Plot of Biofilm Stages") +
  theme_minimal() +
  theme(text = element_text(size = 14))

# ---------------------- Functional Annotation using ORA ------------------
#Functional annotation was performed using GO over-representation analysis (ORA) implemented in clusterProfile
#Doing enrichment for Upregulated and Downregulated genes respectively
#Using the Mature to Early model because it shows the strongest biological contrast as it fully represents the developmental transition and the transcriptional changes and structural and metabolic reprogramming

#Yeast annotation database
BiocManager::install("org.Sc.sgd.db")

sig_up_mature <- rownames(resLFC_mature[
  resLFC_mature$padj < 0.05 &
    resLFC_mature$log2FoldChange > 0, ])

sig_down_mature <- rownames(resLFC_mature[
  resLFC_mature$padj < 0.05 &
    resLFC_mature$log2FoldChange < 0, ])

#Running GO Enrichment for up regulated genes
ego_up_mature <- enrichGO(
  gene          = sig_up_mature,
  OrgDb         = org.Sc.sgd.db,
  keyType       = "ORF",   
  ont           = "BP",    
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05
)
#Running GO Enrichment for down regulated genes
ego_down_mature <- enrichGO(
  gene          = sig_down_mature,
  OrgDb         = org.Sc.sgd.db,
  keyType       = "ORF",   
  ont           = "BP",    
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05
)
head(ego_up_mature)
head(ego_down_mature)

#Visualization for up regulated genes
barplot(ego_up_mature, showCategory = 15) +
  ggtitle("GO Biological Enrichment: Mature vs Early Biofilm (Upregulated Genes)")
#Visualization for down regulated genes
barplot(ego_down_mature, showCategory = 15) +
  ggtitle("GO Biological Enrichment: Mature vs Early Biofilm (Downregulated Genes)")

#******************************************
#Early vs Thin
sig_up_thin <- rownames(resLFC_thin[
  resLFC_thin$padj < 0.05 &
    resLFC_thin$log2FoldChange > 0, ])

sig_down_thin <- rownames(resLFC_thin[
  resLFC_thin$padj < 0.05 &
    resLFC_thin$log2FoldChange < 0, ])

#Running GO Enrichment for Up regulated genes
ego_up_thin <- enrichGO(
  gene          = sig_up_thin,
  OrgDb         = org.Sc.sgd.db,
  keyType       = "ORF",   
  ont           = "BP",    
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05
)
#Running GO Enrichment for down regulated genes
ego_down_thin <- enrichGO(
  gene          = sig_down_thin,
  OrgDb         = org.Sc.sgd.db,
  keyType       = "ORF",   
  ont           = "BP",    
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05
)

head(ego_up_thin)
head(ego_down_thin)
#Visualization for up regulated genes
barplot(ego_up_thin, showCategory = 15) +
  ggtitle("GO Biological Enrichment: Thin vs Early Biofilm (Upregulated Genes)")
#Visualization for down regulated genes
barplot(ego_down_thin, showCategory = 15) +
  ggtitle("GO Biological Enrichment: Thin vs Early Biofilm (Downregulated Genes)")

#**********************************************************
#Thin to Mature
sig_up_inter <- rownames(resLFC_inter[
  resLFC_inter$padj < 0.05 &
    resLFC_inter$log2FoldChange > 0, ])

sig_down_inter <- rownames(resLFC_inter[
  resLFC_inter$padj < 0.05 &
    resLFC_inter$log2FoldChange < 0, ])

#Running GO Enrichment for up regulated genes
ego_up_inter <- enrichGO(
  gene          = sig_up_inter,
  OrgDb         = org.Sc.sgd.db,
  keyType       = "ORF",  
  ont           = "BP",    
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05
)

head(ego_up_inter)

#Running GO Enrichment for down regulated genes
ego_down_inter <- enrichGO(
  gene          = sig_down_inter,
  OrgDb         = org.Sc.sgd.db,
  keyType       = "ORF",      
  ont           = "BP",       
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05
)
#Visualization for up regulated genes
barplot(ego_up_inter, showCategory = 15) +
          ggtitle("GO Biological Enrichment: Thin vs Mature Biofilm (Upregulated Genes)")
#Visualization for up regulated genes
barplot(ego_down_inter, showCategory = 15) +
  ggtitle("GO Biological Enrichment: Thin vs Mature (Downregulated Genes)")