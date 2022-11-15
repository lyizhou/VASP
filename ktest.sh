#!/bin/bash



#生成vasp静态计算的INCAR
cat > INCAR_static <<!
Global Parameters
  ISTART =  0            (Read existing wavefunction; if there)
  ICHARG =  2            (Non-self-consistent: GGA/LDA band structures)
  LREAL  = .FALSE.       (Projection operators: automatic)
  ENCUT  =  480           (Cut-off energy for plane wave basis set, in eV)
  PREC   =  Accurate     (Precision level)  
  LWAVE  = .FALSE.       (Write WAVECAR or not)
  LCHARG = .FALSE.       (Write CHGCAR or not) 
  ADDGRID= .TRUE.        (Increase grid; helps GGA convergence)

Electronic Relaxation
  ISMEAR =  -5           (Gaussian smearing; metals:1)
  #SIGMA  =  0.05        (Smearing value in eV; metals:0.2)
  NELM   =  60           (Max electronic SCF steps)  
  NELMIN =  4            (Min electronic SCF steps)
  EDIFF  =  1E-06        (SCF energy convergence; in eV)
  GGA  =  PE             (PBEsol exchange-correlation)

Ionic Relaxation
  ISIF   =  2            (Stress/relaxation: 2-Ions, 3-Shape/Ions/V，4-Shape/Ions)
  EDIFFG = -0.001        (Ionic convergence; eV/AA)
  KSPACING = 0.10
!

cp INCAR_static INCAR


for i in $(seq 1 1 8) #K点从6-24，步数为3
do

#生成KPOINTS文件，K点类型：Monkhorst-Pack (M) 或者 Gamma (G)
cat > KPOINTS <<!
Automatic mesh
0
Monkhorst-Pack
$i $i $i
0  0  0
!

module load Intel_compiler/18.0.2

echo "KPOINTS = $i" ; time yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std > ouput #vasp并行运行命令，根据系统自行修改

rm KPOINTS
#提取计算得到的能量
E=$(grep "TOTEN" OUTCAR | tail -1 | awk '{printf "%12.9f \n", $5 }')
echo $i $E >>kpoints_energy.out
done