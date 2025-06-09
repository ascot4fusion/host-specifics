#!/bin/bash

#SBATCH -N 1 -n 1 -c 36
#SBATCH -t 12:00:00
#SBATCH --exclusive
#SBATCH --partition=gen05_skylake
#SBATCH -J ascot5

#SBATCH -e %x.e%j
#SBATCH -o %x.o%j

module purge
module load icc
module load mpi

export OMP_NUM_THREADS=36

export FOR_PRINT=$SLURM_JOB_ID.stdout
srun ascot5_main
