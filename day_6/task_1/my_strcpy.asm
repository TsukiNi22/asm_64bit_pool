section .text
    global my_strcpy

my_strcpy:
    mov r14, rdi ; dest
    mov r15, rsi ; src

    cmp r14, 0
    je .error
    cmp r15, 0
    je .error

    xor r10, r10
    .loop:
        mov bl, [r15 + r10]
        mov [r14 + r10], bl

        inc r10
    
        cmp bl, 0
        jne .loop

    mov rax, r14
    ret

.error:
    xor rax, rax
    ret
