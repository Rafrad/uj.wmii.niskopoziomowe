 %define a qword [ebp+8]
 %define b qword [ebp+16]
 %define P qword [ebp+24]
 %define Q qword [ebp+32]
 %define xmin qword [ebp+40]
 %define xmax qword [ebp+48]
 %define k dword [ebp+56]
 %define wartosci dword [ebp+60]

 segment .data
 Two dw 2
 segment .text
 global tablicuj
 tablicuj:

 push ebp
 mov ebp, esp
 push ebx                 ; KONWENCJA C - musimy zachować oryginalne dane z rejestru EBX

 mov eax, wartosci
 mov ecx, k

 fld xmax
 fld xmin
 fsubp ST1     ; stack: xmax-xmin
 fild k         ; stack; k, xmax-xmin
 fdivp ST1     ; stack: interval

 fld xmin      ; stack: x, int

 while:
 fild word [Two] ; stack: 2, x, int
 fldpi           ; stack: pi, 2, x, int
 fmulp ST1       ; stack: 2*pi, x, int
 fmul ST1        ; stack: 2*pi*x, x, int
 
 fld P
 fmul ST1        ; stack: P*2*pi*x, 2*pi*x, x, int
 fsin            ; stack: sin(P*2pix), 2pix, x, int
 fmul ST0        ; stack: sin(P*2pix)^2, 2pix, x, int
 fld a           ; stack: a, ...
 fmulp ST1       ; stack: a*..., 2pix, x, int
 
 fld Q
 fmul ST2        ; stack: Q*2pix, a*..., 2pix, x, int
 fsin            ; stack: sin(Q*2pix), a*..., 2pix, x, int
 fmul ST0        ; stack: sin(Q*2pix)^2, a*..., 2pix, x, int
 fld b
 fmulp ST1       ; stack: b*..., a*..., 2pix, x, int

 faddp ST1       ; stack: a*...+b*..., 2pix, x, int
 fstp qword [eax]
 fstp ST0        ; stack; x, int
 fadd ST1        ; stack: x_new, int 
 add eax, 8
 loop while
 
 quit:
 pop ebx
 mov esp, ebp
 pop ebp
 ret
