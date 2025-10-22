section .bss
    char resb 1

section .text
    global putstr

print_char:
    mov [char], sil

    mov rax, 1
    mov rdi, 1
    mov rsi, char
    mov rdx, 1
    syscall

    ret

putstr:
    mov r10, rdi

    mov rbx, -1
    cmp r10, 0
    je .return

    mov rbx, 0
    
.loop:
    mov sil, byte [r10 + rbx]
    call print_char

    cmp rax, 1
    jne .return

    inc rbx
    cmp byte [r10 + rbx], 0
    jne .loop

.return:
    mov rax, rbx
    ret
