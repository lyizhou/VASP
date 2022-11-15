#!/bin/bash

#SBATCH -p gsc       # Queue
#SBATCh -N 1            # Node count required for the job
#SBATCH -n 24           # Number of tasks to be launched
#SBATCH -J Pu           # Job name

export LD_LIBRARY_PATH=/THFS/opt/intel/composer_xe_2013_sp1.3.174/mkl/lib/intel64:/THFS/opt/intel/composer_xe_2013_sp1.3.174/compiler/lib/intel64:$LD_LIBRARY_PATH
g09 < DEC.gjf