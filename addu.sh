#!/bin/sh

cat >> INCAR << EOF

#### DFT+U ####
LDAU = .TRUE.
LDAUTYPE = 2
LDAUL = 2 -1
LDAUU = 3.0 0.0
LDAUJ = 0.0 0.0
LMAXMIX = 4
EOF
