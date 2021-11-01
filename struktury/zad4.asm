%include "asm64_io.inc"

segment .bss
n resq 1
a resq 1

segment .text
global asm_main
asm_main:
  enter 0,0

  ; get all data  
  mov rax, msg_n
  call print_string
  call read_int
  mov [n], eax
  mov rax, msg_a
  call print_string
  call read_int
  mov [a], eax
  mov rax, msg_b
  call print_string
  call read_int
  mov edx, eax
  call print_nl
  
  mov ecx, [a]
  mov eax, [n]
  loop_from_a_to_b:  ; iterate from a to b(edx)
    cmp ecx, edx
    ja end_loop
    
    find_nwd:
      cmp ecx, 1
      je found_relatively_prime
      cmp eax, 1
      je found_relatively_prime
      
      cmp ecx, eax   ; compare eax ecx
      jb sub_ecx     ; eax >  ecx
      je end_nwd     ; eax == ecx -> not relatively prime

      sub ecx, eax   ; eax - ecx
      jmp find_nwd

      sub_ecx:
      sub eax, ecx   ; eax - ecx
      jmp find_nwd

      found_relatively_prime:
        mov eax, [a]   ; get a
        call print_int ; print a
        mov al, 0x20
        call print_char
    end_nwd:
    
    mov ecx, [a]  ; restore a
    inc ecx
    mov [a], ecx  ; increment a
    mov eax, [n]  ; restore n
    jmp loop_from_a_to_b
  end_loop:

  end:
  call print_nl
  mov eax, 0
  leave
  ret

segment .data
  msg_n db "Number: ", 0
  msg_a db "Interval from: ", 0
  msg_b db "Interval to: ", 0

