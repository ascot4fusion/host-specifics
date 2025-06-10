#!/bin/bash
module purge
module load nvhpc/24.9 
module load hpcx-mpi/2.20 
module load hdf5/1.14.3--hpcx-mpi--2.20--nvhpc--24.9
make clean
make ascot5_main MPI=1 GPU=1 ACC=1 CC=mpicc FLAGS="-L$(HDF5_ROOT)/lib -I$(HDF5_ROOT)/include" -j
