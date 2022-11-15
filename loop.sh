#!/bin/bash
...

set -e
set -o pipefail

module load Intel_compiler/18.0.2

VASP_EXEC="yhrun -N 1 -p gsc -n 24 /THFS/opt/vasp/5.4.4/vasp.5.4.4/bin/vasp_std > ouput"  # "mpirun -np xxx" is also ok

date >> a.txt
for i in $(seq 0.9 0.005 1.1)
do
  sed -i "2c $i" POSCAR
  echo -e "a = $i angstrom"
  eval ${VASP_EXEC}
  E=`grep "TOTEN" OUTCAR | tail -1 | awk '{printf "%12.6f", $5 }'`
  V=`grep "volume" OUTCAR | tail -1 | awk '{printf "%12.4f", $5}'`
  printf "a = %6.3f Vol = %10.4f Energy = %18.10f\n" $i $V $E >> a.txt
  tail -1 a.txt
done
echo -e "\n\n" >> a.txt#+end_src