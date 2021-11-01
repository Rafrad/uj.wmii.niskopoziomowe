#!/bin/sh
#nasm -f elf zadanie.asm
#ld -m elf_i386 -s -o zadanie zadanie.o
nasm -felf64 $1.asm -o $1.o -g && ld $1.o -o $1
./$1
