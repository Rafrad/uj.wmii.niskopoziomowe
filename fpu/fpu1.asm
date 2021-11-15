 %define a qword [ebp+8]
 %define b qword [ebp+16]
 %define c qword [ebp+24]
 %define d qword [ebp+32]
 %define x qword [ebp+40]
 %define solution qword [ebp-8]
 
 segment .data
 segment .text
 global wartosc
 wartosc:
 enter 0, 0

 sub esp, 8
 push ebx

 fld x	;stack: a
 fld a
 fmul ST1	;stack: a*x, x
 fld b		;stack: b, a*x, x
 faddp ST1      ;stack: b+a*x, x
 fmul ST1       ;stack: b*x+a*x^2, x
 fld c		;stack: c, b*x+a*x^2, x
 faddp ST1      ;stack: c+..., x
 fmulp ST1	;stack: x*c+x*...
 fld d
 faddp ST1

 quit:
 pop ebx
 mov esp, ebp
 pop ebp
 ret
