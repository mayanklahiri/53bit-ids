#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $DIR

make

ulimit -v 2048000
ulimit -m 2048000
ulimit -H -v
ulimit -H -m

./53bit-ids > ../data/cpp.txt 2> /dev/null

popd
