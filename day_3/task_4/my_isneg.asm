section .data
    negative_letter db 'N'
    positive_letter db 'P'

section .text
    global my_isneg

my_isneg:

    push rbp
    mov rbp, rsp

    cmp edi, 0
    mov rsi, positive_letter
    jge .print
    mov rsi, negative_letter

.print:
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall

    cmp rax, 1
    jne .error

    mov rsp, rbp
    pop rbp

    mov rax, 0
    ret

.error:

    mov rax, 1
    ret
