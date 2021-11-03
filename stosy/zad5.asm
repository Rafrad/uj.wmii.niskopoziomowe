%include "asm64_io.inc"

segment .data
arr db 1, 2, 3, 7, 5, 2, 1, 2

segment .bss

segment .text
global asm_main
asm_main:
  enter 0,0
   
  mov eax, 3
  mov edi, 6
  div edi

  call print_int  

  end:
  mov eax, 0
  leave
  ret

