%include "asm64_io.inc"

segment .data
msg db "Enter a number: ", 0
is_prime db "Your number is a prime", 0xa, 0
is_not_prime db "Your number is not a prime", 0xa, 0

segment .bss
n1 resq 1

segment .text
global asm_main
asm_main:
  enter 0,0

  mov eax, msg
  call print_string
  call read_int
  mov [n1], eax

  cmp eax, 1	;jump if n1 = 1
  je not_prime

  mov ecx, [n1] ;init loop
  dec ecx
  for_loop:     ; loops check if n1(eax) is divisible by i(ecx)
    cmp ecx, 1
    jbe for_loop_end
    
    mov eax, [n1]
    mov edx, 0
    div ecx
    
    cmp edx, 0    ; check if divisible
    je not_prime

    dec ecx
    jmp for_loop
  for_loop_end: 

  prime:
  mov eax, is_prime
  call print_string
  jmp end

  not_prime:
  mov eax, is_not_prime
  call print_string
  jmp end
  
  end:
  mov eax, 0
  leave
  ret
