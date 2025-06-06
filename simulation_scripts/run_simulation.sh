#!/bin/bash
./gps-sdr-sim -e ephemeris/brdc1520.25n -x user_motion/circle_llh.csv -t 2025/06/1,9:50:00 -d 600 -b 8 -o output/gpssim.bin
