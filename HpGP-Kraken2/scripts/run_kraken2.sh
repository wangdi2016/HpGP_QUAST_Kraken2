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
