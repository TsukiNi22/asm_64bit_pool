section .text
    global my_strupcase

my_strupcase:
    mov rax, rdi ; str

    cmp rax, 0
    je .null

    xor r10, r10
    .loop:
        mov r11b, [rax + r10]
        
        cmp r11b, 0
        je .return

        cmp r11b, 97 ; a
        jb .next
        cmp r11b, 122 ; z
        ja .next

        sub byte [rax + r10], 32

    .next:
        inc r10
        jmp .loop

.return:
    ret

.null:
    xor rax, rax
    ret
