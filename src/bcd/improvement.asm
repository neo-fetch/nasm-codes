		extern printf
		SECTION .data


fmt:	db	"The resultant BCD is: ", 10, 0
fmtshort:	db	"%lu	", 0

binary:	dq  1010101011011010b				; 16 bit binary number (8 byte int) = 1001101010011010
msb:	dq	0					; most significant bit size int msv = 0 (initially)

decimal: dq	0					;decimal value
temp: dq	0					;decimal value
divider:	dq	1				; used to isolate the msb of the decimal;

		SECTION .text				; code section
		global main

main:
	push rbp					; base pointer
	mov r14,[binary]					; decimal(initially) = 0;
	mov rdi,fmt					; storing format in the 1st register
	call printf					; calling printf

	mov r13,[msb]					;size
	mov [decimal],r14				;save in decimal var
	mov r11,r14					;loading the decimal value
	mov [temp],r14
	mov r12,0					;for comparision
	jmp calculateSize
ccalculateSize:
	mov rdx,0
	mov rax,r11
	mov rbx,10
	div rbx
	mov r11,rax					; remainder: rdx, quotient: r11 <- rax	
	inc r13
	mov [msb],r13
calculateSize:
	cmp r12,r11					;0<decimal?
	jl ccalculateSize

	sub r13,1
	mov r11,r13					;i = msb-1
	mov r12,[divider]				;div = 1
	mov rcx,0
	jmp calculatedivider

ccalculatedivider:
	imul r12,10					;multiply r12 by 10
	mov [divider],r12				;store
	dec r11						;decrement i
calculatedivider:
	cmp rcx,r11					;0 < i?
	jl ccalculatedivider				;jump if met

	mov r11,[temp]					;i = a
	jmp bcd

cbcd:
	mov rdx,0					;
	mov rax,r11					;
	mov rbx,[divider]					;
	div rbx					;
	mov r15,rax					; remainder: rdx, quotient: decimal <- rax
	mov [decimal],r15					; store in [decimal] this is *msb*
	mov r12,1					; place = 1
	mov r13,0					; binary = 0
	jmp convertToBinary				; start binary conversion
cconvertToBinary:
	mov rdx,0					; 
	mov rax,r15					;
	mov rbx,2					;
	div rbx					;
	mov r15,rax					; remainder: r14 <- rdx, quotient: r15 <- rax
	mov r14,rdx					;
	imul r14,r12					;remainder = remainder * place
	add r13,r14					;binary = binary + remainder;
	imul r12,10					;place = place * 10
convertToBinary:
	cmp r15,0					;is r15(digit) == 0?
	jnz cconvertToBinary

	mov rdi,fmtshort				; store the format
	mov rsi,r13					; store the 1st printf var
	call printf					; call printf

	mov r15,[decimal]				; reload msb
	imul r15,[divider]				; r15 = msb * 10 ^ (msb - 1)
	mov r11,[temp]					; reload original converted decimal
	sub r11,r15					; subtract from r15 (removing msb from r11) 
	mov [temp],r11					; store remaining bits
	mov rdx,0					;
	mov rax,[divider]					;
	mov rbx,10					;
	div rbx					;
	mov [divider],rax				; remainder: rdx, quotient: [divider] <- rax
bcd:
	mov rcx,0					; comparision
	mov rax,[divider]				; comparision
	cmp rcx,rax					; 0 != div?
	jnz cbcd					

ending:           
        pop rbp						; pop the stack
        mov rax,0					; exit code
        ret						; return to OS from main