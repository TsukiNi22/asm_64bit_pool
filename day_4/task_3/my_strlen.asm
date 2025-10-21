section .text
    global my_strlen

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
