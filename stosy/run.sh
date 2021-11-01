#!/bin/sh
nasm -f elf zadanie.asm
ld -m elf_i386 -s -o zadanie zadanie.o
./zadanie
