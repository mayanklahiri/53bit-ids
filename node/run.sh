#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $DIR

# node-latest
ulimit -v 2048000
ulimit -m 2048000
ulimit -H -v
ulimit -H -m
n use latest --max-old-space-size=2048 53bit-ids.js > ../data/node-latest.txt 2> /dev/null

# node-lts
ulimit -v 2048000
ulimit -m 2048000
ulimit -H -v
ulimit -H -m
n use lts --max-old-space-size=2048 53bit-ids.js > ../data/node-lts.txt 2> /dev/null

popd
