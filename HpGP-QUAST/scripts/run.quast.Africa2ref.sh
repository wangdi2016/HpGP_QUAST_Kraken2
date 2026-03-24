module load quast

#cd /lscratch/$SLURM_JOB_ID

#QUAST: Quality Assessment Tool for Genome Assemblies
#Version: 5.3.0, c3eb988a

fnadir="/data/wangdi/CGRProjects/HPY/ice/HpGP"

fn=$1

## create output dir
mkdir -p /data/wangdi/CGRProjects/HPY/ice/HpGP/Africa2/${fn}
cd /data/wangdi/CGRProjects/HPY/ice/HpGP/Africa2/${fn}

## run quast
quast.py --threads 2 \
    $fnadir/fna/${fn}.fna \
    -R $fnadir/ref/SouthAfrica20.fna.gz \
    -g $fnadir/ref/SouthAfrica20.gff

