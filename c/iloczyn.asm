BITS 32
section .text 

global iloczyn        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
iloczyn:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

mov edx, [ebp+12]

mov    ecx, [ebp+8]
mov    eax, 1
while:
  imul eax, [edx]
  add edx, 4
loop while

; tu kończy się właściwy kod funkcji

leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret
