SECTION .data

i: db 0
aux_L : db 0

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

    xor edx,edx
    xor eax,eax

jmp loop_linha_cond
loop_linha:
    mov byte [cont_col],0
    
jmp loop_coluna_cond
loop_coluna:                    

    add edx,1


loop_coluna_cond:              
    add byte [cont_col],1
    xor eax,eax
    mov al,[cont_col]
    cmp al,[var]
    jle loop_coluna

loop_linha_cond:               
    add byte [cont_lin],1
    xor eax,eax
    mov al,[cont_lin]
    cmp al,[var]
    jle loop_linha



fim:




    mov eax,edx
; --------------------------------------------------------------------------

    mov esp,ebp
    pop ebp
    ret

 