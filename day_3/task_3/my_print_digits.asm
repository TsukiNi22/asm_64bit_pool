section .data
    digit db '0'

section .text
    global my_print_digits

; Display the digit from '0' to '9'
my_print_digits:

    ; Setup the stack
    push rbp
    mov rbp, rsp

    ; Write the letter
    mov rax, 1  ; syscall nb
    mov rdi, 1  ; fd
    mov rdx, 1  ; nb

.loop:
    mov rsi, digit ; buffer
    syscall

    ; Update the letter
    inc byte [digit]

    ; Loop only if the digit is under '9'
    cmp byte [digit], '9'
    jle .loop ; letter <= '9'

    ; Reset the stack
    mov rsp, rbp
    pop rbp    

    ; Return
    ret
