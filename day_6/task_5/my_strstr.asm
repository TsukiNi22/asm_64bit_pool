section .text
    global my_strstr

my_strstr:
    mov r14, rdi ; src
    mov r15, rsi ; to_find

    cmp r14, 0
    je .null
    cmp r15, 0
    je .null

    xor r10, r10
    .i_loop:

        mov r11, r10
        xor r12, r12
        .j_loop:
            mov bl, [r14 + r11]
            mov al, [r15 + r12]
            inc r11
            inc r12
            
            cmp al, 0
            je .return

            cmp al, bl
            jne .skip

            cmp bl, 0
            jne .j_loop

    .skip:
        mov bl, [r14 + r10]
        inc r10
        cmp bl, 0
        jne .i_loop

    jmp .null

.return:
    mov rax, r14
    add rax, r10
    ret

.null:
    xor rax, rax
    ret
