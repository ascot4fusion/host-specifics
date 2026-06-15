#!/bin/bash

module load hdf5/1.14.3--intel-oneapi-mpi--2021.10.0--oneapi--2023.2.0 intel-oneapi-compilers
make clean
make ascot5_main -j 8 MPI=1 FLAGS="-lhdf5_hl -vecabi=cmdtarget -qno-openmp-offload -diag-disable 3180,10441,10006"