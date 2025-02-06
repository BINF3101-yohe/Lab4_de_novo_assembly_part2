#!/bin/bash 

#SBATCH --partition=Centaurus
#SBATCH --job-name=abyss_job
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=20G

echo "======================================================"
echo "Start Time  : $(date)"
echo "Submit Dir  : $SLURM_SUBMIT_DIR"
echo "Job ID/Name : $SLURM_JOBID : $SLURM_JOB_NAME"
echo "Node List   : $SLURM_JOB_NODELIST"
echo "Num Tasks   : $SLURM_NTASKS total [$SLURM_NNODES nodes @ $SLURM_CPUS_ON_NODE CPUs/node]"
echo "======================================================"
echo ""


mkdir tmp
export TMPDIR=$SLURM_SUBMIT_DIR/tmp

module load abyss/2.3.7

cd $SLURM_SUBMIT_DIR
abyss-pe k=38 B=10G name="SRRXXXXXXXX" in="./SRRXXXXXXXX_1_paired.fastq.gz ./SRRXXXXXXXX_2_paired.fastq.gz"


echo ""
echo "======================================================"
echo "End Time   : $(date)"
echo "======================================================"