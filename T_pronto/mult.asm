SECTION .data

ik: dd 0
aux_L : dd 0

cont_col : dd 0

cont_lin : dd 0

contador_R: dd 0

soma: dd 0

int: dd 4
var: dd 0

%macro Organiza 4
; ----------------------- INICIO MACRO -----------------------------
    ; [cont_lin] = %1 / [cont_col] = %2 / [aux_L] = %3 / [int] = %4

    push eax
    push edx

    mov eax,%1
    mov edx,%3

    mul edx 

    add ecx,eax

    xor eax,eax
    xor edx,edx

    mov eax,%2
    mov edx,%4

    mul edx

    add ebx,eax

    pop edx
    pop eax


; ----------------------- FIM MACRO --------------------------------
%endmacro

%macro multiplica 5
; ----------------------- INICIO MACRO -----------------------------

    ; [ik] = %1 / [soma] = %2 / [aux_L] = %3 / [int] = %4 / [var] = %5

    loop1:
    
    mov eax,[ecx]             ; x = tamanho do int = 4
    mov edx,[ebx]             ; y = aux_L

    add ecx,%4                ; < --- ERRO
    add ebx,%3
 
    mul edx

    add %2,eax

    xor eax,eax
    inc dword %1

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

    mov eax,[aux_L]
    mov bl,4
    mul bl

    mov [aux_L],eax             
    
    ; var = numero de elementos da linha
    ; aux_L =  L * 4
    ; int = 4

    mov ecx,[ebp+8]         ;ecx tem o endereço da primeira casa da matriz A
    mov ebx,[ebp+12]        ;ebx tem o endereço da primeira casa da matriz B
jmp loop_linha_cond
loop_linha:
    mov dword [cont_col],0
loop_coluna:                    
    mov ecx,[ebp+8]         ;ecx tem o endereço da primeira casa da matriz A
    mov ebx,[ebp+12]        ;ebx tem o endereço da primeira casa da matriz B

    Organiza [cont_lin],[cont_col],[aux_L],[int]

   ; inc edx            edx sendo usado p/ testar quantas vezes entra no loop coluna
    mov dword [ik],0
 
    multiplica [ik],[soma],[aux_L],[int],[var]
    

    push eax
    push ebx
  
    
    mov eax,[ebp+16]                    ; passando o endereço da primeira casa da matriz R
    add eax,[contador_R]
    mov ebx,[soma]
    mov [eax],ebx
    mov dword [soma],0
    add dword [contador_R],4


    pop ebx
    pop eax

    add dword [cont_col],1   
   

loop_coluna_cond:           
    xor eax,eax
    mov eax,[cont_col]
    cmp eax,[var]
    jl loop_coluna
    add dword [cont_lin],1 

loop_linha_cond:    
    xor eax,eax
    mov eax,[cont_lin]
    cmp eax,[var]
    jl loop_linha
    


; Fim do loop p/  multiplicar linhas por colunas
fim:
    

    mov eax,[ebp+16] 
; --------------------------------------------------------------------------
    mov esp,ebp
    pop ebp
    ret

 