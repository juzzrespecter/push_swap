#!/bin/bash
gcc bonus_rand.c
./a.out $1 $2 > n_files
ARG="$(cat n_files)"
./push_swap $ARG | wc