section .bss
    char resb 1

section .text
    global my_putstr

print_char:
    push rbp
    mov rbp, rsp

    mov [char], sil

    mov rax, 1
    mov rdi, 1
    mov rsi, char
    mov rdx, 1
    syscall

    mov rsp, rbp
    pop rbp
    ret

my_putstr:
    push rbp
    mov rbp, rsp
    
    mov r10, rdi
    mov rbx, 0

    cmp r10, 0
    je .return

.loop:
    mov sil, byte [r10 + rbx]
    call print_char

    cmp rax, 1
    jne .return

    inc rbx
    cmp byte [r10 + rbx], 0
    jne .loop

.return:
    mov rsp, rbp
    pop rbp
    mov rax, rbx
    ret
