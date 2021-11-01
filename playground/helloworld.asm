section .bss
name resb 5

section .text
global _start
_start:
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, len
int 0x80

mov edx, 6 
mov ecx, name
mov ebx, 2
mov eax, 3
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, hi
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, name
mov edx, 6
int 0x80

mov eax, 1
mov ebx, 0
int 0x80
section .data
msg db "Enter your name: "
len equ $-msg
hi db "Hello "
hi_len equ $-hi
