SECTION .data

ik: db 0
aux_L : db 0

cont_col : db 0

cont_lin : db 0

contador_R: dd 0

soma: dd 0

int: db 4
var: db 0

%macro multiplica 5
; ----------------------- INICIO MACRO -----------------------------

    ; [i] = %1 / [soma] = %2 / [aux_L] = %3 / [int] = %4 / [var] = %5

    loop1:
    
    mov eax,[ecx]             ; x = tamanho do int = 4
    mov edx,[ebx]             ; y = aux_L

    add ecx,%4                ; < --- ERRO
    add ebx,%3
 
    mul dx

    add %2,eax

    xor eax,eax
    inc byte %1

    mov eax,%1
    cmp eax,%5
    jb loop1

    xor eax,eax

  
; ----------------------- FIM MACRO --------------------------------

%endmacro 

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

    mov ecx,[ebp+8]         ;ecx tem o endereço da primeira casa da matriz A
    mov ebx,[ebp+12]        ;ebx tem o endereço 4 
jmp loop_linha_cond
loop_linha:
    mov byte [cont_col],0
loop_coluna:                    

   ; inc edx            edx sendo usado p/ testar quantas vezes entra no loop coluna
    mov byte [ik],0
    multiplica [ik],[soma],[aux_L],[int],[var]

    push eax
    push ebx
  
    
    mov eax,[ebp+16]                    ; passando o endereço da primeira casa da matriz R
    add eax,[contador_R]
    mov ebx,[soma]
    mov [eax],ebx
    ;mov byte [soma],0
    add byte [contador_R],4


    pop ebx
    pop eax

    jmp fim

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
    jl loop_linha
    


; Fim do loop p/  multiplicar linhas por colunas
fim:
  
    mov ebx,[ebp+16]
    mov eax,[ebx] 

; --------------------------------------------------------------------------

    mov esp,ebp
    pop ebp
    ret

 