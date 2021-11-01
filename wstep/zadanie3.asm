section .bss
section .text
global _start
_start:

mov eax, 5
mov ebx, file
mov ecx, 0102o
mov edx, 0666o
int 0x80

mov ebx, eax
mov eax, 4
mov ecx, name
mov edx, name_len
int 0x80

mov eax, 6
int 0x80

mov ebx, eax
mov eax, 1
int 0x80

section .data
file db "file", 0x0
name db "Rafal", 0xA
name_len equ $-name
