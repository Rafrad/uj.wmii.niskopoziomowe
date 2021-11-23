section .text

global _start
_start:
  mov rax, 0x1
  mov rdi, 0x1
  mov rsi, text
  mov rdx, text_len
  syscall
  
  mov rax, 60
  mov rdx, 0x0
  syscall

section .data
 text db "Hello World!", 0ah
 text_len equ $-text
