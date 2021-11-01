%include "asm64_io.inc"

segment .data
number times 32 db 0
number_reversed times 32 db 0
number_size equ $-number
sig db 0
segment .bss
padding resb 1
segment .text
global asm_main
asm_main:
  enter 0,0
 
  mov eax, -6990
  mov rbx, 1
  cmp eax, 0
  jg positive
  neg eax
  mov dl, 1
  mov [sig], dl
  positive:
 
  mov ebx, number 
  mov ecx, 10
  while_eax_gt_1:
    cmp eax, 1
    jb end_while
    
    mov edx, 0
    div ecx
    add dl, 48
    mov [ebx], dl
    
    inc ebx
    jmp while_eax_gt_1
  end_while:
  
  mov dl, [sig]
  cmp dl, 0
  je positive2
  mov [ebx], byte 0x2d
  jmp negative
  positive2:  
  dec ebx
  negative:

  mov rax, 0
  mov edx, number_reversed
  mov ecx, number
  while_number_ne_ebx:
    cmp ecx, ebx
    ja end_while_number_ne_ebx
    mov al, [ebx]
    mov [edx], al
    inc edx
    dec ebx
  jmp while_number_ne_ebx
  end_while_number_ne_ebx:
  
  mov rax, number_reversed  
  call println_string
  
  mov eax, 0
  leave
  ret
