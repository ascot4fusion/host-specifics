#!/bin/bash -l
#SBATCH --job-name=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=128
#SBATCH --partition=dcgp_fua_prod
#SBATCH --time=01:00:00
module load gcc/12.3.0 
module load hdf5/1.14.3--openmpi--4.1.6--gcc--12.3.0
ulimit -s unlimited
export OMP_NUM_THREADS=128
srun ascot5_main
