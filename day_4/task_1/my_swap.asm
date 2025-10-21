section .text
    global my_swap

my_swap:
    push rbp
    mov rbp, rsp

    mov eax, [rdi]
    xchg eax, [rsi]
    mov [rdi], eax

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
