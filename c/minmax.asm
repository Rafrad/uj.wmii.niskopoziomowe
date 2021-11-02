BITS 32
section .text 
global minmax       ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
minmax:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.
%idefine struct [ebp+8]

mov ebx, ebp

add ebx, 16

mov eax, [ebx] ; min
mov edx, [ebx] ; max

mov    ecx, [ebp+12]
mov    eax, 1

while:
cmp ecx, 0
jbe end_while

  cmp eax, dword [ebx]
  jg eax_max
  mov eax, [ebx]
  eax_max:
  cmp edx, dword [ebx]
  jl edx_min
  mov edx, [ebx]
  edx_min:

  add ebx, 4
  dec ecx
  jmp while
end_while:

mov ebx, eax
mov eax, struct
mov [eax], ebx
mov [eax+4], edx

leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret
