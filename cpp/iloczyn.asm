section .text 

global iloczyn        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
iloczyn:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

;n [RDI]


pop r11
pop r12

push r9
push r8
push rcx
push rdx
push rsi

xor rax, rax
inc rax
mov rcx, rdi
pow:

imul rax, [rsp+rcx*8-8]

loop pow

add rsp, 8*5

push r12
push r11
leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret
