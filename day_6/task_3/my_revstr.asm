section .text
    global my_revstr

strlen:
    xor r11, r11
    .loop:
        cmp byte [r15 + r11], 0
        je .return
        inc r11
        jmp .loop
.return:
    ret

my_revstr:
    mov r15, rdi ; src

    cmp r15, 0
    je .error

    call strlen

    dec r11
    xor r10, r10
    .loop:
        mov bl, [r15 + r10]
        mov al, [r15 + r11]
        mov [r15 + r10], al
        mov [r15 + r11], bl

        inc r10
        dec r11
        cmp r10, r11
        jl .loop

    mov rax, r15
    ret

.error:
    xor rax, rax
    ret
