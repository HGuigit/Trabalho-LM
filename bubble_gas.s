.data
vet: .hex 0
tam .int 0

.text

global bubble_gas

bubble_gas:
push %ebp
mov %esp,%ebp
mov 8(%ebp),%eax
mov 12(%ebp),%ebx
mov %eax, (%vet)
mov %ebx, (%tam)

	#bubble: 
	
	mov 0, %eax 
	mov 0, %ebx 
	mov 0, %ecx 
	mov 0, %edx 

	;bubble sort: 
		jmp for1i
		for1:
			xor edx, edx 
			jmp for2i
			
			for2: 
			mov ebx(%vet), %ah
			mov edx(%vet),ch
			cmp ah, ch 
			jae volta
			mov ch, ebx(%vet)
			mov ah, edx(%vet)
			
			volta: 
			inc edx 
			
			for2i: 
			cmp dx, (%tam)
			jb for2

		inc ebx 

		for1i:
		cmp bx, (%tam)
		jb for1

;agora o vetor está ordenado, portanto o menor elemento está na primeira posição
	mov %ebp, %esp
	pop %ebp
	ret 
