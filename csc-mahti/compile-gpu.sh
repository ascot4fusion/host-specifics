#!/bin/bash
module purge
module load .unsupported nvhpc/22.3

make clean
make libascot MPI=0 GPU=1 ACC=1 CC=nvc FLAGS="-I/appl/spack/v017/install-tree/gcc-9.4.0/hdf5-1.10.7-tvhc5e/include -L/appl/spack/v017/install-tree/gcc-9.4.0/hdf5-1.10.7-tvhc5e/lib -R/appl/spack/v017/install-tree/gcc-9.4.0/hdf5-1.10.7-tvhc5e/lib -gpu=cc80" -j
make ascot5_main MPI=0 GPU=1 ACC=1 CC=nvc FLAGS="-I/appl/spack/v017/install-tree/gcc-9.4.0/hdf5-1.10.7-tvhc5e/include -L/appl/spack/v017/install-tree/gcc-9.4.0/hdf5-1.10.7-tvhc5e/lib -R/appl/spack/v017/install-tree/gcc-9.4.0/hdf5-1.10.7-tvhc5e/lib -gpu=cc80" -j
