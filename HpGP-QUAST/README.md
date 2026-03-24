# HpGP_ICE_QUAST

## Overview
This repository summarizes the comparative assembly quality assessment of *Helicobacter pylori* genomic sequences (**HpGP**) using **QUAST** with proper reference sequences.  

The goal of this analysis is to evaluate genome fraction among *H. pylori* strains from different geographic origins, using published representative reference genomes from **Europe**, **East Asia**, and **Africa2**.

For the assembly quality assessment of *de novo* genomic sequences, please check the BUSCO results [https://github.com/HpGP/HpGP-Genome-QC](https://github.com/HpGP/HpGP-Genome-QC). All 1012 sequences have **> 95%** completeness score from BUSCO (100% is the max). 

---

## Methods
- **Tool:** QUAST (Quality Assessment Tool for Genome Assemblies)  
- **Input:** *De novo* assembled, circular, complete genomic sequences from 1012 *H. pylori* genomes  
- **References:**  
  - *Hp 26695* (Europe) (https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000008525.1/) 
  - *F16* (East Asia) (https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_000270005.1/)
  - *SouthAfrica20* (Africa2) (https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000590775.1/) 
- **Metric Reported:** % Genome fraction aligned to each reference genome  

---

## Selected Reference Genomes, and HpGP *de novo* Genomic Sequences

### F16
- **Publication:** Mikihiko Kawai *et al.*  
  *Evolution in an oncogenic bacterial species with extreme genome plasticity: Helicobacter pylori East Asian genomes*  
  *BMC Microbiology* **11**, Article 104 (2011)  
- **Database:** GenBank (F16 strain sequence deposited)

---

### SouthAfrica20 and SouthAfrica7
- **Publication:** Stacy S. Duncan *et al.*  
  *Genome Sequences of Three hpAfrica2 Strains of Helicobacter pylori*  
  *Genome Announcements* **1**(5): e00729-13 (2013)  
  DOI: [10.1128/genomeA.00729-13](https://doi.org/10.1128/genomeA.00729-13)  
- **Database:** GenBank (SouthAfrica20 strain sequence deposited)

---

### H. pylori 26695
- **Publication:** Tomb F. *et al.*  
  *The complete genome sequence of the gastric pathogen Helicobacter pylori*  
  *Nature* **388**, 539–547 (1997)  
- **Database:** GenBank (26695 strain sequence deposited)

---

### H. pylori Genome Project (HpGP)
- **Publication:** Kaisa Thorell *et al.*  
  *The Helicobacter pylori Genome Project: insights into H. pylori population structure from analysis of a worldwide collection of complete genomes*  
  *Nature Communications* **14**, 8184 (2023)
- **Database:** GenBank (1012 HpGP sequence deposited)

---

## Comparative Results

### 1. *Hp 26695* (Europe)
Using the European reference genome *Hp 26695* **(https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000008525.1/)**, high genome alignment quality was observed mainly among European-origin strains. Our *de novo* assembled Hp 26695 is **100%** in term of genome fraction. Using variant calling pipeline, we only identified ~130 SNPs between the publish *Hp 26695* and our *HpGP-26695-ATCC* **(https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_034695665.1/)**. In addition, only one structural variant obsersved. Together, it indicates the excellent agreement between these two sequences.

Strains from other regions (e.g. South Africa and East Asia) exhibited substantially lower genome fractions, indicating clear sequence divergence from the European lineage. **Only 15 strains showing here in the table (See complete result from Eur.genome_fraction.xlsx).**

<img width="471" height="257" alt="image" src="https://github.com/user-attachments/assets/ca1d8b13-5f90-44c0-9f71-8917b50601cd" />

### 2. *F16* (East Asia)
With the public East Asian reference *F16* **(https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_000270005.1/)**, only strains from East Asia (Japan, China, Korea, Singapore) achieved **>90% genome fraction**, reflecting strong sequence conservation within the East Asian cluster.  
**Only 15 strains showing here in the table (See complete result from EAsia.genome_fraction.xlsx).**

<img width="472" height="257" alt="image" src="https://github.com/user-attachments/assets/61c563bb-fd2b-44a6-9e26-61f3220e6ebd" />

### 3. *SouthAfrica20 and SouthAfrica7* (Africa2)
Using the public African reference *SouthAfrica20* **(https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000590775.1/)** and *SouthAfrica7* **(https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000185245.1/)**, only four strains — **HpGP-ZAF-001**, **HpGP-ZAF-006**, **HpGP-ZAF-007**, and **HpGP-ZAF-009** — reached **>80% genome fraction**. The rest sequences are less than 10%. 

This finding indicates that the Africa2 lineage possess region-specific structures distinct from other populations. **Only 15 strains showing here in the table (See complete result from Africa2.genome_fraction.xlsx).**

#### *SouthAfrica20*
<img width="474" height="257" alt="image" src="https://github.com/user-attachments/assets/e7854530-7b66-4f2d-ba0d-737d9c2449de" />

#### *SouthAfrica7*


### 4. *GrafGen Bioconductor package*
For future identification of the population of new strains, we have developed GrafGen, a R package to address this issue (https://www.bioconductor.org/packages/release/bioc/html/GrafGen.html). The manuscript has been accepted by BMC Bioinformatics. We presented the results in 2024 AACR (https://aacrjournals.org/cancerres/article/84/6_Supplement/789/736762/Abstract-789-GrafGen-Distance-Based-Inference-of).

---

## Conclusion
Comparative analyses with QUAST demonstrate clear **geographic clustering and sequence divergence** across *H. pylori* populations from Europe, East Asia, and Africa.  
These results highlight the **regional adaptation and evolutionary differentiation** of genomic sequences, reflecting the co-evolution between *H. pylori* and its human host populations.

---

## Citation
If you use this dataset or analysis summary, please cite:
- Andrés Julián Gutiérrez-Escobar *et al.*
*Global diversity of integrating conjugative elements (ICEs) in Helicobacter pylori and their influence on genome architecture* (2025)


