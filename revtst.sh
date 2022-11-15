#!/bin/bash
#过渡态继续计算脚本，将中间态的CONTCAR复制为POSCAR继续执行过渡态计算
for dir in 0*;do 
	cd $dir;
	if [ -f "CONTCAR" ];then
		cp POSCAR POSCAR_back;
		mv CONTCAR POSCAR;
		cd ../;
	else 
		cd ../;
	fi
done
