#!/bin/bash
nasm -felf64 -o $1.o $1.asm
gcc -m64 -o $2.o -c $2.cpp
gcc -m64 $2.o $1.o -o $1
./$1
