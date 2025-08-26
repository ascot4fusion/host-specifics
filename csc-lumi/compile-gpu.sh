#!/bin/bash
module purge
module load craype-accel-amd-gfx90a craype-network-ofi craype-x86-trento
module load PrgEnv-cray-amd/8.5.0
module load cray-hdf5 amd-mixed cpe
make clean
make ascot5_main MPI=1 OMP=1 GPU=1 NSIMD=1 CC=cc FLAGS=" -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx90a"  -j
