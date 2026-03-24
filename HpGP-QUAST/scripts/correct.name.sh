for f in `cat 1012set.list`
do

echo "== $f =="
awk -v N=$f 'BEGIN{print ">"N} NR>1 {print $0}' ./fna/${f}.fsa > ./fna/${f}.fna

done
