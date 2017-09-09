#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $DIR

# CPython 2
ulimit -v 2048000
ulimit -m 2048000
ulimit -H -v
ulimit -H -m
python 53bit-ids.py > ../data/cpython2.txt 2> /dev/null

# CPython 3
ulimit -v 2048000
ulimit -m 2048000
ulimit -H -v
ulimit -H -m
python3 53bit-ids.py3 > ../data/cpython3.txt 2> /dev/null

# Pypy (Python 2)
ulimit -v 2048000
ulimit -m 2048000
ulimit -H -v
ulimit -H -m
pypy 53bit-ids.py > ../data/pypy.txt 2> /dev/null

popd
