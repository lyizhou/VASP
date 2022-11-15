#!/bin/bash

sed -i -e 3a\LCHARG=.TRUE. INCAR
sed -i '2c ISTART=1' INCAR
sed -i '3c ICHARG=1' INCAR