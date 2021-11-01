%include "asm64_io.inc"

segment .data
s1 dw "abcdefghijklmnopqrstuvwxyz", 0
s1_length equ $ - s1
s2 dw "zyxwvutsrqponmlkjihgfedcba", 0
s2_length equ $ - s2

segment .bss
input resb 100
inputLength resb 1

segment .text
global asm_main
asm_main:
  enter 0,0


  mov rax, 0
  mov rdi, 0
  mov rsi, input
  mov rdx, 100
  syscall

  dec eax
  mov [inputLength], eax

; iterate over input
  mov r8d, 0
Next:
  ; input char
  mov r9d, [input + r8d]

  mov eax, r9d
  ; iterate and replace
  mov rcx, s1_length ; liczba elementów tablicy
  dec rcx
  mov r11, s1
  iterate:
    mov al, [r11 + rcx -2]

    cmp al, r9b
    je found

  loop iterate

  ; not found
  ;mov eax, notfound
  ;call println_string
  mov eax, r9d
  call print_char
  jmp iterator_exit

  found:
  ;mov eax, founds
  ;call println_string
  mov r11, s2
  mov r12, s2_length
  mov al, [r11 + rcx - 2]
  call print_char


  iterator_exit:
  inc r8d
  cmp r8d, [inputLength]
  jne Next



end:

call print_nl

mov rax, 0
leave
ret
