section .data
    digit_a db 0
    digit_b db 1
    
    separator db ", "
    len_separator equ $ - separator

    first db 1

section .bss
    char resb 1

section .text
    global my_print_comb2

print_char:
    push rbp
    mov rbp, rsp

    mov [char], sil

    mov rax, 1
    mov rdi, 1
    mov rsi, char
    mov rdx, 1
    syscall
    
    cmp rax, 1
    jne .error

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

.error:
    mov rsp, rbp
    pop rbp
    mov rax, 1
    ret

print_separator:
    push rbp
    mov rbp, rsp

    cmp byte [first], 1
    je .return

    mov rax, 1
    mov rdi, 1
    mov rsi, separator
    mov rdx, len_separator
    syscall
    
    cmp rax, len_separator
    jne .error

.return:
    mov byte [first], 0
    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

.error:
    mov rsp, rbp
    pop rbp
    mov rax, 1
    ret

print_2digit:
    push rbp
    mov rbp, rsp

    movzx rax, sil
    xor rdx, rdx
    mov r10, 10
    idiv r10

    mov r12b, al
    mov r13b, dl
    
    add r12b, '0'
    mov sil, r12b
    call print_char
    
    cmp rax, 0
    jne .error

    add r13b, '0'
    mov sil, r13b
    call print_char
    
    cmp rax, 0
    jne .error

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

.error:
    mov rsp, rbp
    pop rbp
    mov rax, 1
    ret

print_digit:
    push rbp
    mov rbp, rsp

    mov sil, byte [digit_a]
    call print_2digit

    cmp rax, 0
    jne .error

    mov sil, ' '
    call print_char
    
    cmp rax, 0
    jne .error

    mov sil, byte [digit_b]
    call print_2digit

    cmp rax, 0
    jne .error

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

.error:
    mov rsp, rbp
    pop rbp
    mov rax, 1
    ret

check_end:
    push rbp
    mov rbp, rsp
    
    mov rax, 0

    cmp byte [digit_a], 99
    jl .return
    
    cmp byte [digit_b], 99
    jl .return
    
    mov rax, 1

.return:
    mov rsp, rbp
    pop rbp
    ret

increment_digit:
    push rbp
    mov rbp, rsp

    inc byte [digit_b]
    cmp byte [digit_b], 99
    jle .return

    inc byte [digit_a]
    mov al, byte [digit_a]
    add al, 1
    mov byte [digit_b], al

.return:
    mov rsp, rbp
    pop rbp
    ret

my_print_comb2:
    push rbp
    mov rbp, rsp

.loop:
    call print_separator
    cmp rax, 0
    jne .error
    
    call print_digit
    cmp rax, 0
    jne .error
    
    call increment_digit
    
    call check_end
    cmp rax, 1
    jne .loop

    mov sil, 10
    call print_char
    
    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

.error:
    mov rsp, rbp
    pop rbp
    mov rax, 1
    ret
