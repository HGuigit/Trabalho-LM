SECTION .text

global soma_asm

soma_asm:

    push ebp
    mov ebp,esp

; manipulação do vetor 

    mov eax,[ebp+8]
    mov edx, [eax]
    add eax, 4
    add edx,[eax]
    add eax,4
    add edx,[eax]
    add eax,4
    add edx,[eax]
    mov eax,edx





    mov esp,ebp
    pop ebp
    ret


