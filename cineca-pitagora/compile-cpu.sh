#!/bin/bash
module purge
module load gcc/12.3.0 
module load hdf5/1.14.3--openmpi--4.1.6--gcc--12.3.0 
make clean
make ascot5_main -j MPI=1 OMP=1 NSIMD=8 CC=mpicc  FLAGS=" --offload=disable"
