section .text
    global my_evil_str

my_strlen:
    push rbp
    mov rbp, rsp
    
    mov r10, rdi

    mov rax, -1
    cmp r10, 0
    je .return

    mov rax, 0
    
.loop:
    inc rax
    cmp byte [r10 + rax], 0
    jne .loop

.return:
    mov rsp, rbp
    pop rbp
    ret

my_evil_str:
    push rbp
    mov rbp, rsp
    
    call my_strlen
    mov r11, rax
    cmp r11, -1
    je .error

    mov rbx, 0
    dec r11

.loop:
    mov al, [r10 + rbx]
    xchg al, [r10 + r11]
    mov [r10 + rbx], al

    inc rbx
    dec r11
    cmp rbx, r11
    jl .loop
    
    mov rsp, rbp
    pop rbp
    mov rax, r10
    ret

.error:
    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
