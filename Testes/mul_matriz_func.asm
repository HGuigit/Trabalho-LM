SECTION .data

i: db 0
aux_L : db 0

cont_col : db 0

cont_lin : db 0

contador_R: db 0

soma: dd 0

int: db 4
var: db 0

SECTION .text
global mul_matriz

mul_matriz:

    push ebp
    mov ebp,esp


    mov eax,[ebp+20]                
    mov [aux_L],eax                 
    mov [var],eax

    mov ax,[aux_L]
    mov bl,4
    mul bl

    mov [aux_L],eax             
    
    ; var = numero de elementos da linha
    ; aux_L =  L * 4
    ; int = 4

; --------------------------------------------------------------------------

    mov ecx,[ebp+8]         ;ecx tem o endereço da primeira casa da matriz A
    mov ebx,[ebp+12]        ;ebx tem o endereço da primeira casa da matriz B

    xor edx,edx
    xor eax,eax

jmp loop_linha_cond
loop_linha:
    mov byte [cont_col],0
    mov ebx,[ebp+12]

    push eax
    push ebx

    xor eax,eax
    xor ebx,ebx

    mov eax,[aux_L]
    mov ebx,[cont_lin]

    mul bx

    mov ecx,[ebp+8]
    add [ecx],eax
    

    pop ebx
    pop eax
    
   
jmp loop_coluna_cond
loop_coluna:                    


    loop_soma:
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
    jb loop_soma


    push ebx

    
    mov ebx,[ebp+16]
    mov eax,[contador_R]
    add [ebx],eax
    mov eax,[soma]
    mov [ebx],eax

    pop ebx



    jmp fim



    mov byte [soma],0           ; zerando a variavel soma p/ calcular a proxima linha x coluna
    add byte [contador_R],4

loop_coluna_cond:   
    add byte [cont_col],1           
    xor eax,eax
    mov al,[cont_col]
    cmp al,[var]
    jl loop_coluna
    

loop_linha_cond:    
    add byte [cont_lin],1
    xor eax,eax
    mov al,[cont_lin]
    cmp al,[var]
    jl loop_linha
    


fim:



    mov eax,[ebp+16]
; --------------------------------------------------------------------------

    mov esp,ebp
    pop ebp
    ret

 