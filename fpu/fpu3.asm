 %define n dword [ebp+8]
 %define x dword [ebp+12]
 %define y dword [ebp+16]

 segment .data

 segment .text
 global iloczyn_skalarny
 iloczyn_skalarny:

 push ebp
 mov ebp, esp
 push ebx                 ; KONWENCJA C - musimy zachować oryginalne dane z rejestru EBX

 mov ecx, n
 mov eax, x
 mov edx, y
 fldz
 while:
 fld tword [eax]
 fld tword [edx]
 fmulp ST1
 faddp ST1
 add eax, 12
 add edx, 12
 loop while

 quit:
 pop ebx
 mov esp, ebp
 pop ebp
 ret
