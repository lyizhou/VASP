#!/bin/bash

#SBATCH -p gsc               # Queue
#SBATCh -N 1            # Node count required for the job
#SBATCH -n 24           # Number of tasks to be launched
#SBATCH -J Cu           # Job name

yhrun -p gsc -N 1 /THFS/opt/cp2k/cp2k-7.1-libxc-libinit-libxsmm/exe/Linux-x86-64-intel/cp2k.popt -in Si_bulk8.inp