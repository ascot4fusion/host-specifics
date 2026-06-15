#!/bin/bash

# Make the following change in the Makefile first
# -       CFLAGS += -shlib
# +       CFLAGS += -shared
#
# With the above change the code compiles but will segfault when running.
# Instead, comment out the above line.
module purge
module load aocc mpich hdf5/1.10.7-mpi
make clean
make libascot -j 8 MPI=1 FLAGS="-lhdf5_hl"
make ascot5_main -j 8 MPI=1 FLAGS="-lhdf5_hl"
