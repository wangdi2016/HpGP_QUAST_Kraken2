# 🧬 Kraken2 Analysis of 1011 HpGP Genome Sequences

## 📌 Overview

This repository documents the taxonomic classification of **1011 Helicobacter pylori Genome Project (HpGP)** genome sequences using **Kraken2**.

It includes:

* Genome data download instructions
* Kraken2 database setup
* Analysis pipeline scripts
* Aggregated classification results

---

## 📂 Repository Structure

```
├── data/                # genome data
├── scripts/             # Kraken2 pipeline scripts
├── results/             # output files and summary tables
├── docs/                # additional documentation
└── README.md
```

---

## 📥 Data Download

### HpGP H. pylori Genome Sequences

Download genome FASTA files using:

```bash
wget https://zenodo.org/records/10048320/files/HpGP-1012set-ncbi.tar.gz
```

Or from NCBI:

* BioProject: PRJNA529500
* Example:

```
https://www.ncbi.nlm.nih.gov/bioproject/PRJNA529500
```

---

## ⚙️ Kraken2 Setup

### Install Kraken2

```bash
conda create -n kraken2 -c bioconda kraken2 -y
conda activate kraken2
```

### Build Kraken2 Database

```bash
kraken2-build --standard --db kraken_db
```

### Download Kraken2 standard index (2026-02-26)

```bash
## Standard DB 96.8GB
https://benlangmead.github.io/aws-indexes/k2
wget https://genome-idx.s3.amazonaws.com/kraken/k2_standard_20260226.tar.gz

tar xvf k2_standard_20260226.tar.gz
```
---

## 🚀 Running Kraken2

Example batch script:

```bash
#!/bin/bash

module load kraken/2.1.2

DB=k2_standard_20260226
INPUT_DIR=data/genomes
OUTPUT_DIR=results

mkdir -p $OUTPUT_DIR

for file in $INPUT_DIR/*.fna; do
    base=$(basename $file .fna)

    kraken2 \
        --db $DB \
        --threads 8 \
        --report $OUTPUT_DIR/${base}.txt \
        --output $OUTPUT_DIR/${base}.kraken2 \
        $file

done
```

---

## 📊 Results

### Summary Table (Preview)

| Sample ID | Total Reads | Classified (%) | Unclassified (%) | Top Species |
| --------- | ----------- | -------------- | ---------------- | ----------- |
| Sample1   | 1000000     | 98.5           | 1.5              | H. pylori   |
| Sample2   | ...         | ...            | ...              | ...         |

👉 Full results available at:
`results/kraken2_summary.tsv`

---

## 📈 Output Description

* `*.txt` → detailed taxonomic breakdown
* `*.kraken2` → classification output
* `kraken2_summary.tsv` → aggregated summary of all samples

---

## Additional testing on non H. pylori genome sequences

* We further downloaded three non H. pylori genome sequences, E. coli K12, Sheeba, and YS1 for testing.

```bash
## E. coli K12
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz

## Sheeba
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/009/305/GCF_000009305.1_ASM930v1/GCF_000009305.1_ASM930v1_genomic.fna.gz

## YS1 from Helicobacter himalayensis sp. nov. strain 80(YS1)T from Marmota himalayana in the Qinghai-Tibet Plateau, China
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/001/602/095/GCF_001602095.1_ASM160209v1/GCF_001602095.1_ASM160209v1_genomic.fna.gz
```

* #### Escherichia coli K-12 identified as Escherichia coli K-12

```
100.00  1       0       R       1       root
100.00  1       0       R1      131567    cellular organisms
100.00  1       0       R2      2           Bacteria
100.00  1       0       K       3379134       Pseudomonadati
100.00  1       0       P       1224            Pseudomonadota
100.00  1       0       C       1236              Gammaproteobacteria
100.00  1       0       O       91347               Enterobacterales
100.00  1       0       F       543                   Enterobacteriaceae
100.00  1       0       G       561                     Escherichia
100.00  1       0       S       562                       Escherichia coli
100.00  1       0       S1      83333                       Escherichia coli K-12
100.00  1       1       S2      879462                        Escherichia coli str. K-12 substr. MG1655star
```

* #### Helicobacter acinonychis str. Sheeba identified as Helicobacter acinonychis str. Sheeba

```
100.00  2       0       R       1       root
100.00  2       0       R1      131567    cellular organisms
100.00  2       0       R2      2           Bacteria
100.00  2       0       K       3379134       Pseudomonadati
100.00  2       0       P       29547           Campylobacterota
100.00  2       0       C       3031852           Epsilonproteobacteria
100.00  2       0       O       213849              Campylobacterales
100.00  2       0       F       72293                 Helicobacteraceae
100.00  2       0       G       209                     Helicobacter
100.00  2       0       S       212                       Helicobacter acinonychis
100.00  2       2       S1      382638                      Helicobacter acinonychis str. Sheeba
```

* #### Helicobacter himalayensis identified as Helicobacter himalayensis

```
100.00  1       0       R       1       root
100.00  1       0       R1      131567    cellular organisms
100.00  1       0       R2      2           Bacteria
100.00  1       0       K       3379134       Pseudomonadati
100.00  1       0       P       29547           Campylobacterota
100.00  1       0       C       3031852           Epsilonproteobacteria
100.00  1       0       O       213849              Campylobacterales
100.00  1       0       F       72293                 Helicobacteraceae
100.00  1       0       G       209                     Helicobacter
100.00  1       1       S       1591088                   Helicobacter himalayensis
```

---

## 🔁 Reproducibility

* Kraken2 version: 2.1.2
* Database: Standard Kraken2 DB
* Date: 2026-02-26
* OS: Linux

---

## 🧠 Notes

* Classification accuracy depends on database completeness
* Assembly quality of genomes may influence results

---

## 📚 Citation

If you use Kraken2:

Wood DE, Lu J, Langmead B.
**Improved metagenomic analysis with Kraken 2.**
Genome Biology (2019).

---

## 🤝 Acknowledgements

* Helicobacter pylori Genome Project (HpGP)
* Kraken2 developers

---

