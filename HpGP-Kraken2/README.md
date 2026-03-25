# Kraken2 Analysis of 1011 HpGP Genome Sequences

## Overview

This repository documents the taxonomic classification of **1011 Helicobacter pylori Genome Project (HpGP)** genome sequences using **Kraken2**.

It includes:

* Genome data download instructions
* Kraken2 database setup
* Analysis pipeline scripts
* Aggregated classification results

---

## Repository Structure

```
├── data/                # genome data
├── scripts/             # Kraken2 pipeline scripts
├── results/             # output files and summary tables
├── docs/                # additional documentation
└── README.md
```

---

## Data Download

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

## Kraken2 Setup

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

## Running Kraken2

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

## Results

### Summary Table (Preview)

| seqid           | taxid   | length  | genus            | species             | strain                            |
| --------------- | ------- | ------- | ---------------- | ------------------- | --------------------------------- |
| HpGP-ALG-001    | 1426844 | 1631355 | Helicobacter     | Helicobacter pylori | Helicobacter pylori NY40          |
| HpGP-ALG-002    | 907240  | 1636597 | Helicobacter     | Helicobacter pylori | Helicobacter pylori Gambia94/24   |
| HpGP-ALG-003    | 1321939 | 1653596 | Helicobacter     | Helicobacter pylori | Helicobacter pylori UM037         |
| HpGP-ALG-004    | 592205  | 1636089 | Helicobacter     | Helicobacter pylori | Helicobacter pylori B38           |
| HpGP-ALG-005    | 907240  | 1563520 | Helicobacter     | Helicobacter pylori | Helicobacter pylori Gambia94/24   |
| HpGP-ALG-006    | 907240  | 1617933 | Helicobacter     | Helicobacter pylori | Helicobacter pylori Gambia94/24   |
...
| HpGP-ZAF-001    | 907239  | 1714499 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |
| HpGP-ZAF-002    | 907239  | 1725063 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |
| HpGP-ZAF-004    | 907239  | 1666673 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |
| HpGP-ZAF-006    | 907239  | 1641225 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |
| HpGP-ZAF-007    | 907239  | 1655871 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |
| HpGP-ZAF-008    | 907239  | 1557316 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |
| HpGP-ZAF-009    | 907239  | 1681930 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |
| HpGP-ZAF-010    | 907239  | 1688654 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |
| HpGP-ZAF-011    | 907239  | 1723727 | Helicobacter     | Helicobacter pylori | Helicobacter pylori SouthAfrica7  |

Full results available at:
`results/kraken2_summary.tsv`

---

## Output Description

* `*.txt` → detailed taxonomic breakdown
* `*.kraken2` → classification output
* `kraken2_summary.tsv` → aggregated summary of all samples

---

## Additional testing on three non H. pylori genome sequences

* We further downloaded three non H. pylori genome sequences, E. coli K12, Sheeba, and YS1 for testing.

```bash
## E. coli K12
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz

## Sheeba
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/009/305/GCF_000009305.1_ASM930v1/GCF_000009305.1_ASM930v1_genomic.fna.gz

## YS1 from Helicobacter himalayensis sp. nov. strain 80(YS1)T from Marmota himalayana in the Qinghai-Tibet Plateau, China
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/001/602/095/GCF_001602095.1_ASM160209v1/GCF_001602095.1_ASM160209v1_genomic.fna.gz
```

### Summary Table for three non H. pylori genome sequences

| seqid           | taxid   | length  | genus            | species                  | strain                                 |
| --------------- | ------- | ------- | ---------------- | ------------------------ | -------------------------------------- |
| GCF_000005845.2 | 83333   | 4641652 | Escherichia      | Escherichia coli         | Escherichia coli K-12                  |
| GCF_000009305.1 | 382638  | 1553927 | Helicobacter     | Helicobacter acinonychis | Helicobacter acinonychis str. Sheeba   |
| GCF_001602095.1 | 1591088 | 1829936 | Helicobacter     | Helicobacter himalayensis|                                        |

* Escherichia coli K-12 identified as Escherichia coli K-12
* Helicobacter acinonychis str. Sheeba identified as Helicobacter acinonychis str. Sheeba
* Helicobacter himalayensis identified as Helicobacter himalayensis

---

## Reproducibility

* Kraken2 version: 2.1.2
* Database: Standard Kraken2 DB
* Date: 2026-02-26
* OS: Linux

---

## Notes

* Classification accuracy depends on database completeness
* Assembly quality of genomes may influence results

---

## Citation

If you use the results, please cite the following work:

Andrés Julián Gutiérrez-Escobar et al. 
**Global diversity of integrating conjugative elements (ICEs) in Helicobacter pylori and their influence on genome architecture**
Communications Biology (2026).

Wood DE, Lu J, Langmead B.
**Improved metagenomic analysis with Kraken 2.**
Genome Biology (2019).

---

## Acknowledgements

* Helicobacter pylori Genome Project (HpGP)
* Kraken2 developers

---

