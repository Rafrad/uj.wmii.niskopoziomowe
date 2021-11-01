%include "asm64_io.inc"

segment .data
number times 32 db 0
number1 db "1324", 0
segment .bss

segment .text
global asm_main
asm_main:
  enter 0,0
  
  mov rbx, number
  mov rax, 5214
  call int_to_str
  call println_string

  mov rax, number1
  call str_to_int
  call println_int

  end:
  mov eax, 0
  leave
  ret


  ; str_to_int
  ; Inp
  ; RAX - pointer to a string
  ; Out
  ; RAX - number
  str_to_int:
  push rcx

  mov rcx, rax
  mov rax, 0
  iterate_through_string:
    cmp byte [rcx], 0
    je end_iteration
    
    imul rax, 10
    sub byte [rcx], 48
    add al, [rcx]

    inc rcx
  jmp iterate_through_string
  end_iteration:
  
  pop rcx
  ret

  ; int_to_str
  ; Inp
  ; RAX - number
  ; RBX - empty string
  ; Out
  ; RAX - pointer to a string 
  int_to_str:
  push rcx
  push rdx
  
  cmp eax, 0
  jg positive
  neg eax
  mov r8b, 0x2d
  positive:   

  dec rsp
  mov byte [rsp], 0
  mov ecx, 10
  while_gt_1:
    cmp eax, 1
    jb end_while_gt
  
    mov edx, 0
    div ecx
    add dl, 48
     
    dec rsp
    mov [rsp], dl
   
    jmp while_gt_1
  end_while_gt:
  
  cmp r8b, 0x2d
  jne dont_add_minus
  dec rsp
  mov byte [rsp], 0x2d
  dont_add_minus:

  mov rax, rbx
  while_rsp_ne_0:
    cmp byte [rsp], 0
    je end_while_rsp

    mov dl, byte [rsp]
    mov [ebx], dl

    inc ebx
    inc rsp
    jmp while_rsp_ne_0
  end_while_rsp:

  mov byte [ebx], 0
  inc rsp
  
  pop rdx
  pop rcx  
  ret 
