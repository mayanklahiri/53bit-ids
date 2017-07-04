#!/bin/bash -x
g++ -O3 -march=native --std=c++11 -o 53bit-ids 53bit-ids.cpp

ulimit -v 2048000
ulimit -m 2048000
ulimit -H -v
ulimit -H -m

./53bit-ids > stdout-cpp.txt 2> stderr-cpp.txt
python 53bit-ids.py > stdout-py2.txt 2> stderr-py2.txt
python3 53bit-ids.py3 > stdout-py3.txt 2> stderr-py3.txt
pypy 53bit-ids.py > stdout-pypy.txt 2> stderr-pypy.txt
node --no-turbo --max-old-space-size=2048 53bit-ids.js > stdout-node.txt 2> stderr-node.txt

Rscript plot.R
