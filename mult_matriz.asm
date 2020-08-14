SECTION .data
cont1: db 0
cont2: db 0
cont3: db 0

posA: db 0
posB: db 0

xor eax, eax
xor ebx, ebx
xor ecx, ecx
xor edx, edx

jmp for1cond
for1: 
inc cont1
	jmp for2cond:
	for2:
	inc cont2
		jmp for3cond
		for3:
		inc cont3
			;posA
			mov eax, [cont1]
			mov bx, [L]
			mul bx
			add eax, [cont2]
			xor ebx, ebx
			mov ebx, byte 4
			mul ebx
			mov [posA], eax
			;posB
			mov eax, [cont1]
			mov bx, [L]
			mul bx
			add eax, [cont2]
			xor ebx, ebx
			mov ebx, byte 4
			mul ebx
			mov [posB], eax

			xor eax, eax 
			xor ebx, ebx

			mov eax, matriz
			mov bx, matriz
			add eax, [posA]
			add bx, [posB]
			mul bx

		for3cond:
		cmp cont3, [L]
		jb for3

	;matriz_R[i][j] = soma;
	;soma = 0;

	for2cond:
	cmp cont2, [L]
	jb for2

for1cond: 
cmp cont1, [L]
jb for1
