BITS 32
section .text 

extern scanf
extern printf
global main       ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
main:
enter 0, 0        

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

push b
push a
push input
call scanf
add esp, 4*3

mov    eax, [a]
mov    edi, [b]
cdq
idiv    edi

push eax
push output
call printf
add esp, 4*2

xor eax, eax
; tu kończy się właściwy kod funkcji

leave              
ret

section .data
input: db "%d %d", 0
output: db "%d", 10, 0
a: times 4 db 0
b: times 4 db 0
