SECTION .text

global soma_asm

soma_asm:

    push ebp
    mov ebp,esp

; manipulação do vetor 

    mov eax,[ebp+8]

    
    add byte[eax],10

    add byte[eax+4],10

    add byte[eax+8],10

    add byte[eax+12],10





    mov esp,ebp
    pop ebp
    ret

