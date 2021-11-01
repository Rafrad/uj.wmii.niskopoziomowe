%include "asm64_io.inc"

segment .data

segment .bss
temp resq 1

segment .text
global asm_main
asm_main:
  enter 0,0

  call read_int

  mov ecx, 2
  mov [temp], eax
  iterate_2_to_n:   ; divide input until it is equal 1
    cmp eax, 1         ; check the number is 1
    jbe end_iteration  ; if yes end loop

    divide_n:
      mov edx, 0
      div ecx
      
      cmp edx, 0
      je divisible
      
      mov eax, [temp]    ; restore eax
      jmp end_division   ; end division for i(ecx) 

      divisible:
        mov [temp], eax    ; update new number
        mov eax, ecx     
        call print_int     ; print it
        mov al, 0x20
        call print_char    ; print space
        mov eax, [temp]    ; restore eax
        jmp divide_n 
    end_division:
    
    inc ecx
    jmp iterate_2_to_n     
  end_iteration:

  end:
  call print_nl
  mov eax, 0
  leave
  ret
