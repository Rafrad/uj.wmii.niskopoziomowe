section .text 

global wartosc        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
wartosc:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

;a [XMM0]
;b [XMM1]
;x [XMM2]
;n [RDI]
; (a*x+b)^n

mulsd xmm0, xmm2
addsd xmm0, xmm1

pow:
cmp rdi, 1
jbe end_pow
mulsd xmm0, xmm0

sub rdi, 1
jmp pow
end_pow:
leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret
