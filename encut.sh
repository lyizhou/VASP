#!/bin/sh

###ENCUT test
rm WAVECAR
for i in `seq -w 150 25 550`
do
cat > INCAR << !
System = test_energy
PREC = A
ISTART = 0
ICHARG = 2
ENCUT = $i
ISMEAR = 0
LREAL = Auto
NCORE = 4
!

echo "ENCUT= $i eV"

module load Intel_compiler/18.0.2

yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std > ouput

E=`grep "TOTEN" OUTCAR | tail -1 | awk '{printf "%12.6f\n",$5}'`
echo $i $E >> tet_ENCUT.dat
done