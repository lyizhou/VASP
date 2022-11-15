#!/bin/bash

#SBATCH -p gsc       # Queue
#SBATCh -N 1            # Node count required for the job
#SBATCH -n 24           # Number of tasks to be launched
#SBATCH -J Pu           # Job name

export LD_LIBRARY_PATH=/THFS/opt/intel/composer_xe_2013_sp1.3.174/mkl/lib/intel64:/THFS/opt/intel/composer_xe_2013_sp1.3.174/compiler/lib/intel64:$LD_LIBRARY_PATH
yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std > ouput