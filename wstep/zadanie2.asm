section .bss
n1 resb 2
n2 resb 2
sum resb 3

section .text
global _start
_start:
mov eax, 4         ; Start of data gathering
mov ebx, 1
mov ecx, msg1
mov edx, msg1_len
int 0x80

mov edx, 2 
mov ecx, n1
mov ebx, 2
mov eax, 3
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, msg2_len
int 0x80

mov edx, 2
mov ecx, n2
mov ebx, 2
mov eax, 3
int 0x80           ; End of data gathering

mov al, [n1]       ; Sanitizing numbers
sub al, '0'        
add al, [n2]
sub al, '0'
mov ecx, sum

cmp al, 10         ; Checking if > 10
jb below10

mov byte [ecx], '1'
inc ecx      ; Move pointer
inc edx      ; Increase size 
sub al, 10

below10:
add al, '0'
add ah, 0xA
mov [ecx], ax

mov eax, 4
mov ebx, 1
mov ecx, sum
int 0x80

mov eax, 1
mov ebx, 0
int 0x80

section .data
msg1 db "Enter a number(0-9): "
msg1_len equ $-msg1
msg2 db "Enter another number(0-9): "
msg2_len equ $-msg2
res db "Sum "
res_len equ $-res
