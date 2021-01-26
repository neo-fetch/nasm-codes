		extern printf
		SECTION .data


fmt:    db      "The resultant matrix/vector is: ", 0
fmtshort: db    "%d, ", 0

k:  dq  0               ; 64 bit int var k = 0
j:	dq	0				; 64 bit int var j = 0
mata1:	dd	01,02,03	; MATRIX A ROW 1.
mata2:	dd	04,05,06	; MATRIX A ROW 2.
mata3:	dd	07,08,09	; MATRIX A ROW 3.
matb1:	dd	01,02,03	; MATRIX B ROW 1.
matb2:	dd	04,05,06	; MATRIX B ROW 2.
matb3:	dd	07,08,09	; MATRIX B ROW 3.
ANS:	times	9	dd	0




		SECTION .text   ; code section
		global main

main:
	push rbp					; base pointer
	mov rbx,0					; j = 0;
	mov r14,0					; k = 0;
	mov rdi,fmt					; storing format in the 1st register
	call printf					; calling printf
	jmp loop1					; Jump to condition first
cloop1:	
	mov r12,0					; to transverse in an array
	mov r13,rbx					; move j to r13
	imul r13,4					; multiply it by 4 for integer jumps
	mov rax,[matb1 + r13]				; load MATRIX B ROW 1
	mov r15,[matb2 + r13]				; load MATRIX B ROW 2
	mov rcx,[matb3 + r13]				; load MATRIX B ROW 3

	mov r11,[mata1 + r12]				; load MATRIX A ROW 1 Col 1
	imul r11,rax					; multiply it with matb row 1
	add r12,4					; move to the next element in the row

	mov r13,[mata1 + r12]				; load MATRIX A ROW 1 Col 2
	imul r13,r15					; multiply it with matb row2
	add r11,r13					; add it to the original register
	add r12,4					; move to the next element in the row

	mov r13,[mata1 + r12]				; load MATRIX A ROW 1 Col 3
	imul r13,rcx					; multiply it with matb row 3
	add r11,r13					; add it to the original register
		
	mov r12,r14					; load K to r14
	imul r12,4					; multiply it by 4 for integer jumps
	mov [ANS + r12],r11				; store the answer in [ANS:] array at the kth index
	mov rdi,fmtshort				; store the format
	mov rsi,[ANS + r12]				; store the 1st printf var
	call printf					; call printf
	inc rbx						; increment j
	inc r14						; increment k
loop1:   
	cmp rbx,3					; Check the condition (j<3)
	jl cloop1					; Jump to content of the loop if met

	mov rbx,0					; j = 0;
	mov r14,0					; k = 0;
	jmp loop2					; Jump to next loop

cloop2:	
	mov r12,0					; to transverse in an array
	mov r13,rbx					; move j to r13
	imul r13,4					; multiply it by 4 for integer jumps
	mov rax,[matb1 + r13]				; load MATRIX B ROW 1
	mov r15,[matb2 + r13]				; load MATRIX B ROW 2
	mov rcx,[matb3 + r13]				; load MATRIX B ROW 3

	mov r11,[mata2 + r12]				; load MATRIX A ROW 2 Col 1
	imul r11,rax					; multiply it with matb row 1
	add r12,4					; move to the next element in the row

	mov r13,[mata2 + r12]				; load MATRIX A ROW 2 Col 2
	imul r13,r15					; multiply it with matb row2
	add r11,r13					; add it to the original register
	add r12,4					; move to the next element in the row

	mov r13,[mata2 + r12]				; load MATRIX A ROW 2 Col 3
	imul r13,rcx					; multiply it with matb row 3
	add r11,r13					; add it to the original register
		
	mov r12,r14					; load K to r14
	imul r12,4					; multiply it by 4 for integer jumps
	mov [ANS + r12],r11				; store the answer in [ANS:] array at the kth index
	mov rdi,fmtshort				; store the format
	mov rsi,[ANS + r12]				; store the 1st printf var
	call printf					; call printf
	inc rbx						; increment j
	inc r14						; increment k
loop2:   
	cmp rbx,3					; Check the condition (j<3)
	jl cloop2					; Jump to content of the loop if met


	mov rbx,0					; j = 0;
	mov r14,0					; k = 0;
	jmp loop3					; Jump to next loop

cloop3:	
	mov r12,0					; to transverse in an array
	mov r13,rbx					; move j to r13
	imul r13,4					; multiply it by 4 for integer jumps
	mov rax,[matb1 + r13]				; load MATRIX B ROW 1
	mov r15,[matb2 + r13]				; load MATRIX B ROW 2
	mov rcx,[matb3 + r13]				; load MATRIX B ROW 3

	mov r11,[mata3 + r12]				; load MATRIX A ROW 3 Col 1
	imul r11,rax					; multiply it with matb row 1
	add r12,4					; move to the next element in the row

	mov r13,[mata3 + r12]				; load MATRIX A ROW 3 Col 2
	imul r13,r15					; multiply it with matb row2
	add r11,r13					; add it to the original register
	add r12,4					; move to the next element in the row

	mov r13,[mata3 + r12]				; load MATRIX A ROW 3 Col 3
	imul r13,rcx					; multiply it with matb row 3
	add r11,r13					; add it to the original register
		
	mov r12,r14					; load K to r14
	imul r12,4					; multiply it by 4 for integer jumps
	mov [ANS + r12],r11				; store the answer in [ANS:] array at the kth index
	mov rdi,fmtshort				; store the format
	mov rsi,[ANS + r12]				; store the 1st printf var
	call printf					; call printf
	inc rbx						; increment j
	inc r14						; increment k
loop3:   
	cmp rbx,3					; Check the condition (j<3)
	jl cloop3					; Jump to content of the loop if met

ending:           
	pop rbp						; pop the stack
	mov rax,0					; exit code
	ret						; return to OS from main