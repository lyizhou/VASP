#!/bin/bash
#SBATCH xx
...

set -e
set -o pipefail

VASP_EXEC="srun /path/to/vasp"  # "mpirun -np xxx" is also ok

date >> a.txt
for i in $(seq 0.99 0.001 1.01)
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