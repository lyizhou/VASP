#!/bin/bash
#SBATCH -p gsc               # Queue
#SBATCh -N 1            # Node count required for the job
#SBATCH -n 24           # Number of tasks to be launched
#SBATCH -J Pu           # Job name

export PATH=/THFS/opt/gcc/5.2/bin:$PATH
export LD_LIBRARY_PATH=/THFS/opt/gcc/5.2/lib64/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/THFS/opt/intel/18_1/compilers_and_libraries_2018.0.128/linux/mpi/intel64/lib:/THFS/opt/intel/18_1/compilers_and_libraries_2018.0.128/linux/mkl/lib/intel64_lin:$LD_LIBRARY_PATH
yhrun -N 1 -p gsc -n 24 /THFS/opt/gromacs/5.14/bin/gmx_mpi mdrun -v -deffnm pro
