section .text 

global suma        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
suma:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

;%idefine n [RDI]
;%idefine tab [RSI]

xor rax, rax
iterate:
 cmp rdi, 0
 jbe end_iteration
 
 add rax, [rsi]
 add rsi, 4
 
 sub rdi, 1
 jmp iterate
end_iteration:

; tu kończy się właściwy kod funkcji

leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret
