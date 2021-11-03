BITS 64

section .text

global minmax

minmax:

    push rbp
    mov rbp, rsp

    mov [n], edi ; first argv

    ; tu zaczyna się magia

get_args:

    mov [a], esi
    mov [a + 1*4], edx
    mov [a + 2*4], ecx
    mov [a + 3*4], r8d
    mov [a + 4*4], r9d

find_min:

    mov ecx, [n] ; i = n

    mov eax, [a - 4 + ecx * 4] ; eax = argv[n - 1] -> min

find_min_loop:

    dec ecx ; i --

    cmp ecx, 0
    jle find_max ; if i < 0 then break

    mov ebx, [a + ecx * 4] ; ebx = a[i]

    cmp ebx, eax
    jge find_min_loop ; if a[i] >= min then continue

    mov eax, ebx ; else min = a[i]
    mov [min], eax ; store min

    jmp find_min_loop

find_max:

    mov ecx, [n] ; i = n

    mov eax, [a - 4 + ecx * 4] ; eax = argv[n - 1] -> min

find_max_loop:

    dec ecx ; i --

    cmp ecx, 0
    jle just_return ; if i < 0 then break

    mov ebx, [a + ecx * 4] ; ebx = a[i]

    cmp ebx, eax
    jle find_max_loop ; if a[i] <= max then continue

    mov eax, ebx ; else max = a[i]
    mov [max], eax ; store max

    jmp find_max_loop

just_return:

    xor rax, rax
    mov eax, [max]
    shl rax, 4
    or rax, [min]

    leave ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
    ret

section .data

    min dd 0
    max dd 0
    n dd 0
    a times 5 dd 0
