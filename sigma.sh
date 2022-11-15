#!/bin/sh

###SIGMA test
rm WAVECAR
for i in 0.8 0.5 0.3 0.1 0.08 0.05 ;
do
cat > INCAR << !
System = test_energy
PREC = A
ISTART = 0
ICHARG = 2
ENCUT = 400
ISMEAR = 0
SIGMA = $i
LREAL = Auto
NCORE = 4
!

echo "SIGMA = $i eV"

module load Intel_compiler/18.0.2

yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std > ouput

E=`grep "TOTEN" OUTCAR | tail -1 | awk '{printf "%12.6f\n",$5}'`
echo $i $E >> tet_SIGMA.dat
done