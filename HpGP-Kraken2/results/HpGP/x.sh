for f in `cat xx.1`
do

a=$(tail -n 1 ${f})

echo -e "$f\t$a"  >> all.txt

done
