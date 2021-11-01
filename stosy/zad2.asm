%include "asm64_io.inc"

segment .data
arr db 1, 2, 3, 7, 5, 2, 1, 2

segment .bss

segment .text
global asm_main
asm_main:
  enter 0,0
  
  push 8
  push arr

  call get_max
  call println_int

  end:
  mov eax, 0
  leave
  ret
  
  get_max:
  push rdx

  dec byte [rsp+16+8]
  mov rdx, 0
  mov rax, 0
  mov rdx, [rsp+8+8]
  mov al, [rdx]
  inc rdx
  iterate_through:
    cmp byte [rsp+16+8], 0
    jbe end_iterate_through
    cmp al, [rdx]
    ja no_new_max
    mov al, [rdx]
    no_new_max:
    inc rdx
    dec byte [rsp+16+8]
    jmp iterate_through
  end_iterate_through:

  mov rdx, [rsp+8]
  add rsp, 24
  mov [rsp], rdx
  sub rsp, 24
  mov rdx, [rsp]
  add rsp, 24

  ret
