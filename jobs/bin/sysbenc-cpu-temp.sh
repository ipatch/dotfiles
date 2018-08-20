#!/bin/bash
# NOTE: simple script to measure CPU temp
# REQ: sysbench and istats
# INSTALL: `brew install sysbench istats`

# 1
istats cpu -f
sysbench cpu --cpu-max-prime=20000 --threads=4 run > /dev/null 2>&1
istats cpu -f

# 2
istats cpu -f
sysbench cpu --cpu-max-prime=20000 --threads=4 run > /dev/null 2>&1
istats cpu -f

# 3
istats cpu -f
sysbench cpu --cpu-max-prime=20000 --threads=4 run > /dev/null 2>&1
istats cpu -f

# 4
istats cpu -f
sysbench cpu --cpu-max-prime=20000 --threads=4 run > /dev/null 2>&1
istats cpu -f

# 5
istats cpu -f
sysbench cpu --cpu-max-prime=20000 --threads=4 run > /dev/null 2>&1
istats cpu -f

# 6
istats cpu -f
sysbench cpu --cpu-max-prime=20000 --threads=4 run > /dev/null 2>&1
istats cpu -f
