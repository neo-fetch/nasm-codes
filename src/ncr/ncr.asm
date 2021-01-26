        extern printf

        SECTION .data


fmt:    db "nCr = %d", 10, 0  ;format for printf (used once)

n:  dq  6              ; 64 bit double var n = 10.000
r:  dq  3               ; 64 bit int var r = 3
i:  dq  0               ; 64 bit int var i = 0
npr:  dq  1             ; 64 bit double var npr = 1.000
rfac:   dq  1           ; 64 bit int var npr = 1


        SECTION .text   ; code section
        global main

main:
        push rbp        ; base pointer
        mov rax,[npr]   ; load npr
        mov rbx,[i]     ; load i
        mov rcx,[n]     ; load n
        mov rdx,[r]     ; load r for condition checking 
        ;sub rdx,[r]     ; subtract n - r
        ;sub rdx,1       ; subtract (n = n-r) - 1. now we can compare it to rdx

        jmp loop1       ; Jump to condition first
cloop1  imul rax,rcx    ; multiply the word npr with n
        dec rcx         ; decrement n
        inc rbx         ; increment i
loop1   cmp rbx,rdx     ; Check the condition
        jl cloop1       ; Jump to content of the loop if met

        mov rdx,[r]     ; load r
        mov rcx,[rfac]  ; load rfac
        mov rbx,0       ; set rbx to 0
        jmp loop2       ; Jump to condition first
cloop2  imul rcx,rdx    ; multiply the word rfac with r
        dec rdx         ; decrement r
loop2   cmp rbx,rdx     ; Check the condition(0<=r)
        jl cloop2       ; Jump to content of the loop if met
diva:   
        mov rdx,0
        mov rax,rax
        idiv rcx        ; divide rax(npr) by rcx(rfac)
        mov rdi,fmt     ; storing format
        mov rsi,rax     ; 1st printf var
        mov rax,0       ; make it 0?        
        call printf     ; call the function
        
        pop rbp         ; pop the stack
        mov rax,0       ; exit code
        ret             ; return to OS from main