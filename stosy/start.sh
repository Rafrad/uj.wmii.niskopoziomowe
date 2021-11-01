#!/bin/bash
nasm -felf64 -o $1.o $1.asm
gcc -fno-pie -o $1 $1.o driver64.o asm64_io.o -static
./$1
