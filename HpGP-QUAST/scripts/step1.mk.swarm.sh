for f in `cat 1012set.list`
do

echo "== $f =="
echo "nohup ./run.quast.sh $f > ${f}.log" >> quast.swarm

done
