#!/bin/bash
#SBATCH --job-name="test"
#SBATCH --partition=standard-g
#SBATCH --account=project_462000870
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8     # 8 MPI ranks per node, 16 total (2x8)
#SBATCH --gpus-per-task=8       # Allocate one gpu per MPI rank
#SBATCH --threads-per-core=1
#SBATCH --exclusive
#SBATCH --time=00:10:00
#SBATCH -o ascot5-fildrun.%j.out
#SBATCH -e ascot5-fildrun.%j.err
#export CRAY_ACC_DEBUG=1
#export HSAKMT_DEBUG_LEVEL=7
export HSA_XNACK=1
ulimit -s unlimited
cat << EOF > select_gpu
#!/bin/bash

export ROCR_VISIBLE_DEVICES=\$SLURM_LOCALID
exec \$*
EOF

chmod +x ./select_gpu

CPU_BIND="mask_cpu:7e000000000000,7e00000000000000"
CPU_BIND="${CPU_BIND},7e0000,7e000000"
CPU_BIND="${CPU_BIND},7e,7e00"
CPU_BIND="${CPU_BIND},7e00000000,7e0000000000"

export OMP_NUM_THREADS=1
#export MPICH_GPU_SUPPORT_ENABLED=1

srun --cpu-bind=${CPU_BIND} ./select_gpu ./build/ascot5_main

rm -rf ./select_gpu
