section .data
    digits db "0000000000"
    
    separator db ", "
    len_separator equ $ - separator

    first db 1

section .bss
    len_digits resb 1
    digits_status resb 10
    char resb 1

section .text
    global my_print_combn

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
    movzx rdx, byte [len_digits]
    syscall

    cmp al, byte [len_digits]
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
    movzx rbx, byte [len_digits]
    dec rbx
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
    movzx rbx, byte [len_digits]
    dec rbx
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

    movzx rbx, byte [len_digits]
    dec rbx
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

my_print_combn:
    push rbp
    mov rbp, rsp

    ; Get args
    mov eax, edi
    mov byte [len_digits], al

    cmp byte [len_digits], 10
    jg .error
    cmp byte [len_digits], 0
    jle .error

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
