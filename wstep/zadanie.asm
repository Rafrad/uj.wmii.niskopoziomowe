section .bss
ls1 resb 4
section .text
global _start
_start:

mov rax, 201
mov rdi, time
syscall

mov [time], rax
mov rcx, 3600
mov rdx, 0 
div rcx
mov [hours], rax
mov rcx, 24
mov rdx, 0
div rcx
inc rdx

mov [hours], rdx
mov rax, rdx
mov rcx, 10
mov rdx, 0
div rcx

add rdx, 48
mov [ls1], rdx
mov al, [ls1] 
;mov [format+format_size-5], al

add rcx, 48
;mov [ls1], rcx
;mov al, [ls1]
;mov [format+format_size-6], al  

mov rax, 1
mov rdi, 1
mov rsi, format
mov rdx, format_size
syscall

mov rax, 60
syscall

section .data
time times 32 db 0
hours db 0
format db "XX:XX", 0ah
format_size equ $-format
