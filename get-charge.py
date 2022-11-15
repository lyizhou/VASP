#!/usr/bin/env python
import sys
 
script, Natom = sys.argv
 
# Natom is the atom number when run ths script 
# Convert Natom into integer 
 
Natom = int(Natom)
 
# Creat an empty list 
charge_list = []
 
# read ACF.dat file and add all lines with charges into the charge_list 
# These lines are started with atom numbers: line.rstrip().split()[0]
# line.rstrip() : '    19     -1.2426      6.3529      5.9723      9.9947      1.0601     10.4547'
# line.rstrip().split(): '19', '-1.2426', '6.3529', '5.9723', '9.9947', '1.0601', '10.4547'
 
with open ('ACF.dat', 'r') as infile:
    lines = infile.readlines()
    for line in lines:
        if line.rstrip().split()[0].isdigit(): # == True: # escape the first 2 and last 4 lines  
            charge_list.append(line.rstrip())    
 
# Print the charge information of Natom
for i in  charge_list:
# i.split() is used to split the whole line into different columns 
    if Natom == int(i.split()[0]):
# The 5th data in each line is the charge value, so we print i.split()[4]   
        print Natom, i.split()[4]
