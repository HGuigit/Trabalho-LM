SECTION .data 
vet: DW 0 
tam: DW 0

SECTION .text 

global TRABALHO_LM_EM_GRUPO
TRABALHO_LM_EM_GRUPO: 

	push ebp
	mov ebp, esp
	
	mov eax,[ebp+8];vet recebe o ponteiro do vetor
	mov ebx, [ebp+12]
	
	mov [vet], eax
	mov [tam], ebx
	
	xor ebx, ebx 
	xor eax, eax
	xor ecx, ecx 
	xor edx, edx 

	;bubble sort: 
		jmp for1i
		for1:
			xor edx, edx 
			jmp for2i
			
			for2: 
			mov ah, [vet+ebx]
			mov ch, [vet+edx]
			cmp ah, ch 
			jae volta
			mov [vet+ebx], ch 
			mov [vet+edx], ah
			
			volta: 
			inc edx 
			
			for2i: 
			cmp dx, [tam]
			jb for2

		inc ebx 

		for1i:
		cmp bx, [tam]
		jb for1

;agora o vetor está ordenado, portanto o menor elemento está na primeira posição
	mov esp, ebp
	pop ebp
	ret 

