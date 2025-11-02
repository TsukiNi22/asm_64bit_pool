section .text
    global my_strncpy

my_strncpy:
    mov r14, rdi ; dest
    mov r15, rsi ; src
    mov r11, rdx ; n

    cmp r14, 0
    je .error
    cmp r15, 0
    je .error

    xor r10, r10
    .loop:
        mov bl, [r15 + r10]
        mov [r14 + r10], bl

        cmp bl, 0
        je .return

        cmp r10, r11
        jge .return

        inc r10
        jmp .loop

.return:
    mov rax, r14
    ret

.error:
    xor rax, rax
    ret
