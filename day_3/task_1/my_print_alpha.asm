section .data
    letter db 'a'

section .text
    global my_print_alpha

; Display the alphabet from 'a' to 'b'
my_print_alpha:

    ; Setup the stack
    push rbp
    mov rbp, rsp

.loop:
    ; Write the letter start from 'a'
    mov rax, 1  ; syscall nb
    mov rdi, 1  ; fd
    mov rsi, letter ; buffer
    mov rdx, 1  ; nb
    syscall

    ; Update the letter
    inc byte [letter]

    ; Loop only if the letter is under 'z'
    cmp byte [letter], 'z'
    jle .loop ; letter <= 'z'

    ; Reset the stack
    mov rsp, rbp
    pop rbp    

    ; Return
    ret
