;----------------------------------------------------------------

    ; Vinicius Atsushi Sato Kawai 

    ; ETAPA A - V = 22 (22/4 = 5, resto 2 -> tarefa 2)

    ; ETAPA B - I = 9 (9/2 = 4 , resto 1 -> tarefa 1)

    ; ETAPA C - I = 9 (9/3 = 3 , resto 0 -> tarefa 0)

    ; ETAPA A -> Maior valor do vetor , ETAPA B -> Dígito da Dezena , ETAPA C -> Soma aritmética

;----------------------------------------------------------------

SECTION .data
    vetor: db 78,23,12,87,99,54,11,13,18,55,31,71,74,47,66,61,82,96,22,25
    aux: db '--'

    len equ $-vetor  ; len = 20 nesse exemplo

SECTION .text

    global _start
    _start:
; ------------------- ETAPA A ----------------------------------------

    xor ecx,ecx         ; zerando o ecx que vai percorrer as casas do vetor
    mov dl,[vetor]      ; iniciando o dl com o valor da primeira casa do vetor

loop:
    cmp dl,[vetor+ecx]  ; comparando dl com a casa [vetor+ecx]
    jb achou_maior      ; se dl for menor , então achamos um valor maior 
    
return:
    inc ecx             ; continua percorrendo o vetor enquanto ecx menor que 20(neste exemplo)
    cmp ecx,len
    jb loop

    jmp fim_etapa_A     ; ecx = 20, para de percorrer e da um jump para fim_etapa_A, neste ponto dl ja armazena o maior valor do vetor



achou_maior:
    mov dl,[vetor+ecx]   ; dl recebe o valor da casa de vetor atual percorrida por ecx
    jmp return           ; volta para continuar percorrendo


;Agora o dl tem o maior valor do vetor (99 neste caso)

; --------------------- ETAPA B --------------------------------------

fim_etapa_A:

    mov al,dl               ; preparando para fazer a divisão, movendo o 99 encontrado para o registrador al
    mov byte bl,10          ; registrador bl recebe 10, assim fazendo divisao de 99 por 10 temos na parte inteira da divisao o digito da dezena = 9
    div bl
    
; ---------------------- ETAPA C --------------------------------------

; Agora em al temos o digito da dezena (99 -> digito 9)
; Soma aritmética:

    xor edx,edx             ; zerando registrador edx que vai armazenar os resultados das somas

loop2: 
    add dl,al 
    dec al 

    cmp al,0
    ja loop2

; ---------------------- FIM --------------------------------------



fim:
    
    mov ax,dx           ; movendo o resultado da soma aritmética (45) para o reg. al
    div bl              ; dividindo 45 por 10, al = 4 , ah = 5

    ; agora temos o digito da dezena e unidade de 45, somar 48 em cada um e colocar em um label aux para printar
    
    mov cl,ah 
    add al,'0'          ;transformando o numeral 4 no ASCII de 4
    add cl,'0'          ;trasnformando o numeral 5 no ASCII de 5

    mov [aux],al        ;posição 0 do label aux recebe ASCII do 4
    mov [aux+1],cl      ;posição 1 do label aux recebe ASCII do 5

    mov eax,4           ;printando o resultado da soma aritmética na tela:
    mov ebx,1
    mov ecx,aux 
    mov edx,2
    int 80h
    
    

    ; Encerrando o programa
    mov eax,1
    int 80h

