#!/usr/bin/env python
import math
import random
import time

j = {}
collisions = 0
i = 0

start_time = int(round(time.time() * 1000))

while i < 100000000:
    n = long(math.floor(random.random() * 9007199254740991))
    if n in j:
        collisions += 1
    else:
        j[n] = 1
    if i % 1000000 == 0:
        time_delta = int(round(time.time() * 1000)) - start_time
        print time_delta, i, collisions
    i += 1
