#!/bin/bash

## Note that multi-node simulations with GPU & OpenMP are not supported
#SBATCH -N1 -n1 -c1
#SBATCH --partition=gputest
#SBATCH --gres=gpu:a100:1

#SBATCH -t 24:00:00
#SBATCH -J ascot5
#SBATCH -A <YOR PROJECT HERE>

#SBATCH -e %x.e%j
#SBATCH -o %x.o%j

module load .unsupported nvhpc/22.3

export FOR_PRINT=$SLURM_JOB_ID.stdout
export HDF5_USE_FILE_LOCKING=FALSE #Untested for gpu but this was needed for cpu

echo Job name $SLURM_JOB_NAME
echo Job id $SLURM_JOB_ID

date
srun ./ascot5_main
date
