%include "asm64_io.inc"

segment .data
msg db "Enter a series of numbers till 0 ", 0xa, 0
msg2 db "Enter comparable number ", 0xa, 0
result db "Ammount of smaller numbers: ", 0

segment .bss

segment .text
global asm_main
asm_main:
  enter 0,0

  mov rax, msg
  call print_string

  mov rax, 0
  mov rcx, 0

  read_till_0:
    call read_int
    cmp eax, 0
    je end_read_till_0
    push rax
    inc rcx
    jmp read_till_0
  end_read_till_0:

  mov rax, msg2
  call print_string
  mov rax, 0
  call read_int

  mov rdx, 0
  mov rbx, 0  
  for_all_num:
    cmp rcx, 0
    jbe end_for_all_num
    
    pop rbx
    cmp eax, ebx
 
    jl A_not_bigger 
    inc rdx

    A_not_bigger:
    dec rcx
    jmp for_all_num
  end_for_all_num:
 
  mov rax, result
  call print_string
  mov rax, rdx
  call println_int
  
  end:
  mov eax, 0
  leave
  ret
