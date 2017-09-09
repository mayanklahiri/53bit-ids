#!/usr/bin/env python
import math
import random
import time

# Associative array and collision counter.
generated = {}
collisions = 0
size = 0

# Experiment start time.
t0 = int(time.time() * 1000)

# Run experiment
print('time size collisions')
while True:
    n = int(random.random() * 9007199254740991)
    if n in generated:
        collisions += 1
    else:
        generated[n] = 1

    size = len(generated)
    if size % 100000 == 0:
        time_delta = int(time.time() * 1000) - t0
        print(time_delta, size, collisions)
