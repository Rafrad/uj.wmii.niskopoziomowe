#!/bin/sh
nasm -f elf helloworld.asm
ld -m elf_i386 -s -o helloworld helloworld.o
./helloworld
