#!/bin/bash

module purge
module load mpi
module load icc
make clean
make libascot -j NSIMD=8 CC=mpiicc MPI=1 FLAGS="-xcommon-avx512 -vecabi=cmdtarget"
make ascot5_main -j NSIMD=8 CC=mpiicc MPI=1 FLAGS="-xcommon-avx512 -vecabi=cmdtarget"
