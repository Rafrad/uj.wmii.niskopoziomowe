BITS 32
section .text 

global sortuj        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
sortuj:
enter 0, 0                   ;  tworzymy ramkę stosu na początku funkcji
                   ; ENTER 0,0 = PUSH EBP / MOV EPB, ESP

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.
%idefine a [ebp+8]
%idefine b [ebp+12]
%idefine c [ebp+16]

mov eax, a
mov ebx, b
mov ecx, c

mov edx, [eax]
mov edi, [ebx]
cmp edx, edi
jg a_gt_b
mov [ebx], edx
mov [eax], edi
a_gt_b:

mov edx, [ebx]
mov edi, [ecx]
cmp edx, edi
jg b_gt_c
mov [ebx], edi
mov [ecx], edx
b_gt_c:

mov edx, [eax]
mov edi, [ebx]
cmp edx, edi
jg na_gt_nb
mov [eax], edi
mov [ebx], edx
na_gt_nb:



; tu kończy się właściwy kod funkcji

leave                            ;usuwamy ramkę stosu LEAVE = MOV ESP, EBP / POP EBP
ret
