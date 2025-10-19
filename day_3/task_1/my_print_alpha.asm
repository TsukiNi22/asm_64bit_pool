section .data
    letter db 'a'

section .text
    global my_print_alpha

; Display the alphabet from 'a' to 'z'
my_print_alpha:

    ; Setup the stack
    push rbp
    mov rbp, rsp

    ; Write the letter
    mov rax, 1  ; syscall nb
    mov rdi, 1  ; fd
    mov rdx, 1  ; nb

.loop:
    mov rsi, letter ; buffer
    syscall

    ; Check the execution
    cmp rax, 1
    jne .error

    ; Update the letter
    inc byte [letter]

    ; Loop only if the letter is under 'z'
    cmp byte [letter], 'z'
    jle .loop ; letter <= 'z'

    ; Reset the stack
    mov rsp, rbp
    pop rbp    

    ; Return
    mov rax, 0
    ret

.error:
    ; Return
    mov rax, 1
    ret
