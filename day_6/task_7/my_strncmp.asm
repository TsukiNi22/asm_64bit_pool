section .text
    global my_strncmp

my_strncmp:
    mov r13, rdx ; n
    mov r14, rdi ; s1
    mov r15, rsi ; s2

    cmp r14, 0
    je .null
    cmp r15, 0
    je .null

    xor r10, r10
    xor r11d, r11d
    xor r12d, r12d
    .loop:
        cmp r13, r10 // a, b -> b >= a
        jge .return
        
        mov r11b, [r14 + r10]
        mov r12b, [r15 + r10]
        
        cmp r11b, r12b
        jne .return
        
        cmp r11b, 0
        je .return
        cmp r12b, 0
        je .return

        inc r10

        jmp .loop

.return:
    xor rax, rax
    add eax, r11d
    sub eax, r12d
    ret

.null:
    mov rax, 501
    ret
