# 一些用于vasp计算过程中用到的脚本

## 1. 前处理
* `joball.sh` 一次性进行结构优化、单点自洽计算、非自洽计算。
* `vaspcheck` 检查输入文件合理性。
* `sigma.sh` `SIGMA` 的收敛性测试。
* `kest.sh` K点的收敛性测试。
* `lattice.sh` 晶格参数优化。 

## 2. 计算过程中检查
* `ef.sh` 用于在计算过程中检查能量和力的收敛情况。
* `grad2.py` 输出信息检查汇总。

## 3. 后处理
* `cleanp.sh` 清除文件中运行产生的数据，只保留输入文件和 `CONTACR` 文件。
* `toolkit.py` 用于AIMD输出信息后处理。