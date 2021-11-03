BITS 32
section .bss
section .text 
global minmax       ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
minmax:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP
push ebx

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.
%idefine struct [ebp+8]



mov esi, [ebp+16] ; min
mov edx, [ebp+16] ; max

mov    ecx, [ebp+12]
while:
  mov ebx, [ebp +4*ecx + 12]
  cmp esi, ebx
  jg esi_max
  mov esi, ebx
  esi_max:
  cmp edx, ebx
  jl edx_min
  mov edx, ebx
  edx_min:

loop while

mov eax, struct
mov [eax], edx
mov [eax+4], esi
pop ebx
leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret
