

 segment .data
 Two dw 2
 segment .text
 global prostopadloscian
 prostopadloscian:

 push ebp
 mov ebp, esp
 
 %define a dword [ebp+8]
 %define b dword [ebp+12]
 %define c dword [ebp+16]
 %define obj dword [ebp+20]
 %define pol dword [ebp+24]
 
 push ebx                 ; KONWENCJA C - musimy zachować oryginalne dane z rejestru EBX

 fld a                    ; stack: a
 fld b                    ; stack: b, a
 fmulp st1                ; stack: a*b
 fld c                    ; stack: c, a*b
 fmulp st1                ; stack: a*b*c
 mov ebx, obj
 fstp dword [ebx]         
 fld a                    ; stack: a
 fld b                    ; stack: b, a
 fmul st1, st0            ; stack: b, a*b   
 fld c                    ; stack: c, b, a*b
 fmul st1, st0            ; stack: c, c*b, a*b
 fld a                    ; stack: b, c, c*b, a*b
 fmulp st1, st0           ; stack: a*c, b*c, a*b
 faddp st1
 faddp st1
 fild word [Two]
 fmulp st1
 mov ebx, pol
 fstp dword [ebx]
 
 quit:
 pop ebx
 mov esp, ebp
 pop ebp
 ret
