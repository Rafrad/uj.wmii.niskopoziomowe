 %define a qword [ebp+8]
 %define b qword [ebp+16]
 %define c qword [ebp+24]
 %define d dword [ebp+32]
 %define x dword [ebp+36]
 %define solution dword [ebp-8]
 
 segment .data
test: db "test", 10, 0
test_len: equ $-test
napis: db "dick %d", 10, 0
 segment .text
 extern printf
 global wartosc
 wartosc:
 enter 0, 0

 sub esp, 8
 push napis
 push ebx

 mov eax, 4
 mov ebx, 1
 mov ecx, test
 mov edx, test_len
 int 80h

 fld a
 fmul x
 fld b
 fadd ST1
 fmul x
 fld c
 fadd ST1
 fmul x
 fld d
 fadd ST1
 
 fst qword solution
 
 mov eax, 4
 mov ebx, 1
 mov ecx, test
 mov edx, test_len
 int 80h
 
 add esp, 16
 call printf
 sub esp, 16
 mov eax, solution
 
 mov eax, 4
 mov ebx, 1
 mov ecx, test
 mov edx, test_len
 int 80h

 quit:
 pop ebx
 mov esp, ebp
 pop ebp
 ret
