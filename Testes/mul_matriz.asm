SECTION .data

aux_A : db 0
aux_B : db 0
aux_R : db 0
aux_L : db 0

i: db 0

cont_col : db 0

cont_lin : db 0

soma: dd 0

int: db 4
var: db 0

SECTION .text
global mul_matriz

mul_matriz:

    push ebp
    mov ebp,esp

; --------------------------------------------------------------------------

; manipulação da matriz
; [ebp+8] = matriz a, [ebp+12] = matriz b, [ebp+16] = matriz R , [ebp+20] = L,

    mov eax,[ebp+8]
    mov [aux_A],eax

    mov eax,[ebp+12]
    mov [aux_B],eax

    mov eax,[ebp+16]
    mov [aux_R],eax

    mov eax,[ebp+20]                ; aul_L = 2 neste exemplo
    mov [aux_L],eax                 ; var = 2
    mov [var],eax

    mov ax,[aux_L]
    mov bl,4
    mul bl

    mov [aux_L],eax             ; aux_L vale L * 4


; --------------------------------------------------------------------------

    ;mov eax,[ebp+16]       ;eax tem o endereço da primeira casa da matriz Resposta
    mov ecx,[ebp+8]         ;ecx tem o endereço da primeira casa da matriz A
    mov ebx,[ebp+12]        ;ebx tem o endereço da primeira casa da matriz B
    
loop1:

    mov eax,[ecx]             ; x = tamanho do int = 4
    mov edx,[ebx]             ; y = aux_L

    add ecx,[int]
    add ebx,[aux_L]

    mul dx

    add [soma],eax

    xor eax,eax
    add byte [i],1

    mov eax,[i]
    cmp eax,[var]
    jb loop1

    xor eax,eax

    ; Neste ponto soma tem linha 1 x coluna 1

    mov eax,[soma]
    
    

    mov esp,ebp
    pop ebp
    ret

 

