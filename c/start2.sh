#!/bin/bash
nasm -o $1.obj -felf32 $1.asm
gcc -m32 $1.obj -o $1
./$1
