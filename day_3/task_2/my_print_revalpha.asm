section .data
    letter db 'z'

section .text
    global my_print_revalpha

; Display the alphabet from 'z' to 'a'
my_print_revalpha:

    ; Setup the stack
    push rbp
    mov rbp, rsp
    
.loop:

    ; Write the letter
    mov rax, 1
    mov rdi, 1
    mov rsi, letter
    mov rdx, 1
    syscall

    ; Update the letter
    dec byte [letter]

    ; Loop only if the letter is above or equal to 'a'
    cmp byte [letter], 'a'
    jge .loop ; letter >= 'a'

    ; Reset the stack
    mov rsp, rbp
    pop rbp
    
    ; Return
    ret
