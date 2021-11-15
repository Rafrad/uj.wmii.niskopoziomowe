

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

 fld a                    ; stack: a, -4
 fld b                    ; stack: c, a, -4
 fmulp st1                ; stack: a*c, -4
 fld c
 fmulp st1
 mov ebx, obj
 fstp dword [ebx]
 fld a
 fld b
 fmul st1, st0
 fld c 
 fmul st1, st0
 fld b
 fmulp st1, st0
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
