section .text

global _start

_start:
  ; get sys time
  mov rax, 201
  mov rdi, time ; second from 01.01.1970
  syscall

  ; get ones (second)
  mov edx, 0
  mov eax, [time]
  mov ecx, 10

  div ecx
  mov [time], eax

  add dl, 48
  mov [format+format_size-2], dl ; add to format

  ; get tens (second)
  mov edx, 0
  mov eax, [time]
  mov ecx, 6

  div ecx
  mov [time], eax

  add dl, 48
  mov [format+format_size-3], dl

  ; get ones (minute)
  mov edx, 0
  mov eax, [time]
  mov ecx, 10

  div ecx
  mov [time], eax
  add dl, 48
  mov [format+format_size-5], dl 

  ; get tens (minute)
  mov edx, 0
  mov eax, [time]
  mov ecx, 6

  div ecx
  mov [time], eax
  add dl, 48
  mov [format+format_size-6], dl 

  ; add Warsaw UTC+2
  mov eax, [time]
  add eax, 2

  ; get hours
  mov edx, 0
  mov ecx, 24
  div ecx
  mov eax, edx
  
  mov edx, 0
  mov ecx, 10

  div ecx
  mov [time], eax
  add dl, 48
  mov [format+format_size-8], dl
  add al, 48
  mov [format+format_size-9], al

  ; print format
  mov     rax, 1
  mov     rdi, 1
  mov     rsi, format
  mov     rdx, format_size
  syscall

  mov rax, 60
  syscall

section .bss
  time: resb 32

section .data
  format db "XX:XX:XX", 0ah
  format_size equ $ - format
  testing db "XXXXXXXX", 0ah
  testing_size equ $ - testing
