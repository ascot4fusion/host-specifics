#!/bin/bash -l
#SBATCH --job-name=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu
#SBATCH --time=01:00:00
ulimit -s unlimited
export OMP_NUM_THREADS=1
srun -n 1 ./ascot5_main 

