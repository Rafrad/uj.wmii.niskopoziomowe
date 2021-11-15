#!/bin/bash
nasm -felf32 -o $1.o $1.asm
gcc -m32 -o $2.o -c $2.cpp
gcc -m32 $2.o $1.o -o $1
./$1
