section .text
    global my_strlowcase

my_strlowcase:
    mov rax, rdi ; str

    cmp rax, 0
    je .null

    xor r10, r10
    .loop:
        mov r11b, [rax + r10]
        
        cmp r11b, 0
        je .return

        cmp r11b, 65 ; A
        jb .next
        cmp r11b, 90 ; z
        ja .next

        add byte [rax + r10], 32

    .next:
        inc r10
        jmp .loop

.return:
    ret

.null:
    xor rax, rax
    ret
