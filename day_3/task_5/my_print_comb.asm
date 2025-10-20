section .data
    ; Special case (no correpondance will be found over 10 digits)
    digits db "000"
    len_digits equ $ - digits
    
    separator db ", "
    len_separator equ $ - separator

    first db 1

section .bss
    digits_status resb 10
    char resb 1

section .text
    global my_print_comb

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

print_digit:
    push rbp
    mov rbp, rsp

    mov rax, 1
    mov rdi, 1
    mov rsi, digits
    mov rdx, len_digits
    syscall

    cmp rax, len_digits
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

; Check if all the digit are different
check_digits:
    push rbp
    mov rbp, rsp
    
    mov rax, 1

    ; Reset the status
    mov rbx, 10 - 1
.loop_reset:
    mov byte [digits_status + rbx], 0
    dec rbx
    cmp rbx, 0
    jge .loop_reset

    ; Check for duplicated digit
    mov rbx, len_digits - 1
.loop:
    movzx r12, byte [digits + rbx]
    sub r12, '0'
    cmp byte [digits_status + r12], 1
    je .false

    mov byte [digits_status + r12], 1

    dec rbx
    cmp rbx, 0
    jge .loop
    
    jmp .return

.false:
    mov rax, 0

.return:
    mov rsp, rbp
    pop rbp
    ret

; Check if all the digit are '9'
check_end:
    push rbp
    mov rbp, rsp
    
    mov rax, 0
    mov rbx, len_digits - 1

.loop:
    cmp byte [digits + rbx], '9'
    jne .return
    
    dec rbx
    cmp rbx, 0
    jge .loop

.true:
    mov rax, 1

.return:
    mov rsp, rbp
    pop rbp
    ret

; Increment the digit from right to left
increment_digit:
    push rbp
    mov rbp, rsp

    mov rbx, len_digits - 1

.loop:
    inc byte [digits + rbx]

    cmp rbx, 0
    jle .return
    dec rbx

    cmp byte [digits + rbx + 1], '9'
    jle .return

    mov byte [digits + rbx + 1], '0'
    jmp .loop

.return:
    mov rsp, rbp
    pop rbp
    ret

my_print_comb:
    push rbp
    mov rbp, rsp

    ; Loop while all digits are not '9'
.loop:
    call check_digits
    cmp rax, 0
    je .skip_loop
    
    call print_separator
    cmp rax, 0
    jne .error
    
    call print_digit
    cmp rax, 0
    jne .error
    
.skip_loop:
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
