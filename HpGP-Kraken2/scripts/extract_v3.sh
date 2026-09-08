output="all_samples.kraken2.fractions.tsv"

printf "sample\ttotal_minimizer_hits\tgenus\tgenus_taxid\tgenus_hits\tgenus_fraction\tspecies\tspecies_taxid\tspecies_hits\tspecies_fraction\n" > "$output"


for report in ../results/*.k2.minimizer_report.report; do
    [ -e "$report" ] || continue

    sample=${report%.k2.minimizer_report.report}

    awk -F '\t' -v sample="$sample" '
    $6 == "R" {
        total=$4
    }

    $6 == "G" && $7 == 209 {
        genus=$8
        sub(/^[[:space:]]+/, "", genus)
        genus_taxid=$7
        genus_hits=$4
    }

    $6 == "S" && $7 == 210 {
        species=$8
        sub(/^[[:space:]]+/, "", species)
        species_taxid=$7
        species_hits=$4
    }

    END {
        if (total > 0) {
            genus_fraction=genus_hits/total
            species_fraction=species_hits/total

            printf "%s\t%s\t%s\t%s\t%s\t%.6f\t%s\t%s\t%s\t%.6f\n",
                   sample,
                   total,
                   genus,
                   genus_taxid,
                   genus_hits,
                   genus_fraction,
                   species,
                   species_taxid,
                   species_hits,
                   species_fraction
        }
    }
    ' "$report" >> "$output"
done
