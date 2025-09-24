#!/bin/bash

#SBATCH -N1 -n8 -c32
#SBATCH --partition=test
#SBATCH --hint=multithread
#SBATCH -t 24:00:00
#SBATCH -J ascot5
#SBATCH -A <YOUR PROJECT HERE>

#SBATCH -e %x.e%j
#SBATCH -o %x.o%j

module purge
module load aocc mpich hdf5/1.10.7-mpi

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export FOR_PRINT=$SLURM_JOB_ID.stdout
export HDF5_USE_FILE_LOCKING=FALSE

echo Job name $SLURM_JOB_NAME
echo Job id $SLURM_JOB_ID

date
srun ./ascot5_main
date
