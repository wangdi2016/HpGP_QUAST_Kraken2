for f in `cat HpGP.list`
do

a=$(tail -n 1 ${f})

echo -e "$f\t$a"  >> kraken2_summary.tsv

done
