SECTION .text

%macro multiplica 4

	xor	eax,eax		;Nesta macro: ax � utilizado como �ndice i
	xor	ebx,ebx		;	       bx � utilizado como �ndice j	
	xor	ecx,ecx		;	       cx � utilizado como �ndice k	
	mov	edx,%3		;edx � utilizado para guardar os valores das multiplica��es diretamente na matriz resultante.
				;A utiliza��o de %% nas labels tem como finalidade torna-las labels locais, pois a macro �  
	%%for1:			;chamada mais de uma vez.
		xor	bx,bx				;zera o contador j
		%%for2:
			xor	cx,cx			;zera o contador k
			%%for3:
				push	edx		;guarda o endere�o da matriz resultante na pilha
				push	eax		;guarda o valor do �ndice i na pilha	
				mov	edx,%4	
				mul	dl		;faz a multiplica��o i * L
				add	ax,cx		;adiciona k � multiplica��o, logo: eax = (i * L) + k

				mov	esi,%1		;esi recebe o endere�o da matriz a ser multiplicada (A ou C) 
				mov	esi,[esi+eax*4]	;esi recebe o valor da posi��o a ser multiplicada

				mov	ax,cx		;ax recebe o �ndice k
				mul	dl		;faz a multiplica��o k*L
				add	ax,bx		;adiciona j � multiplica��o, logo: eax = (k * L) + j		

				mov	edi,%2		;edi recebe o endere�o da matriz a ser multiplicada por esi (B ou AB) 
				mov	edi,[edi+eax*4]	;edi recebe o valor da posi��o a ser multiplicada			

				mov	eax,esi
				mul	di
				mov	esi,eax		;resultado da multplica��o � passado para esi
				pop	eax		;restaura o �ndice i
				pop	edx		;restaura o endere�o da posi��o da matriz resultante

				add	[edx],esi		;adiciona o resultado parcial � matriz resultante

				inc	cx
				cmp	%4,ecx		;compara o �ndice k com o tamanho da matriz L
				jnz	%%for3
			add	edx,4			;avan�a para a pr�xima posi��o da matriz resultante
			inc	bx
			cmp	%4,ebx			;compara o �ndice j com o tamanho da matriz L
			jnz	%%for2
		inc	ax
		cmp	%4,eax				;compara o �ndice i com o tamanho da matriz L
		jnz	%%for1
%endmacro

%macro menor 2

	mov	esi,%1					;recebe o endere�o da matriz ABC
	mov	edx,%2					;recebe o tamanho da matriz, L
	mov	bx,dx					;ebx cont�m L
	mov	ax,dx					
	mul	dl					
	mov	dx,ax					;edx cont�m L * L

	mov	eax,[esi]					;inicializa eax com a primeira posi��o da matriz ABC
	xor	ecx,ecx					
loop:
	inc	cx					
	add	cx,bx					;ecx sempre vai estar na posi��o i = j da matriz ABC
	cmp	dx,cx
	jle	fim	
	mov	edi,[esi+ecx*4]				;edi recebe sempre o pr�ximo valor da diagonal principal
	cmp	eax,edi
	jg	troca
	jmp	loop
troca:
	mov	eax,edi
	jmp	loop
fim:

%endmacro

global mulmat
	mulmat:
	enter	0,0	
	push	ebx	;Salva os valores de ebx,esi,edi, pois ser�o utilizados 
	push	edi	;nas macros multiplica e menor
	push	esi		
	multiplica 	[ebp+8],[ebp+12],[ebp+20],[ebp+28]	;A macro recebe a matriz A, B, AB (resultante) e o tamanho da matriz
	multiplica 	[ebp+20],[ebp+16],[ebp+24],[ebp+28]	;A macro recebe a matriz AB, C, ABC (resultante) e o tamanho da matriz
	menor 	[ebp+24],[ebp+28]			;A macro recebe a matriz ABC e o tamanho da matriz
	pop	esi		
	pop	edi	;Restaura os valores dos registradores
	pop	ebx	
	leave		
	ret		;Endere�o de retorno � recuperado da pilha
