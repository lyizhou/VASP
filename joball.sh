#!/bin/bash

#SBATCH -p gsc       # Queue
#SBATCh -N 1            # Node count required for the job
#SBATCH -n 24           # Number of tasks to be launched
#SBATCH -J Pu           # Job name

export LD_LIBRARY_PATH=/THFS/opt/intel/composer_xe_2013_sp1.3.174/mkl/lib/intel64:/THFS/opt/intel/composer_xe_2013_sp1.3.174/compiler/lib/intel64:$LD_LIBRARY_PATH

workpath=`pwd`

## Job1-OPT
cd OPT
yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std 
cd ..

## Job2-SCF
mkdir SCF
cd SCF
cp $workpath/OPT/{CONTCAR,POTCAR,KPOINTS} ./; mv CONTCAR POSCAR; cp ~/input_template/INCAR_scf ./INCAR;
yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std 
cd ..

## Job-DOS
mkdir DOS
cd DOS
cp $workpath/SCF/{POSCAR,CHGCAR,WAVECAR,KPONITS,POTCAR} ./; cp ~/input_template/INCAR_nscf_dos ./INCAR;
yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std 
cd ..

## Job-Band
mkdir BAND 
cd BAND 
cp $workpath/SCF/{POSCAR,CHGCAR,WAVECAR,POTCAR} ./; cp ~/input_template/INCAR_nscf_band ./INCAR; cp ~/input_template/KPOINTS_band ./KPOINTS;
yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std 
cd ..