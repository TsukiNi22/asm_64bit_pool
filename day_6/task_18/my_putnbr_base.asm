section .bss
    char resb 1

section .text
    global my_putnbr_base

my_strlen: ; r11d -> len | r15 -> str
    xor r11, r11
    .loop:
        inc r11
        cmp byte [r15 + r11], 0
        jne .loop
    ret

my_putnbr_base:
    mov r14d, edi ; nbr
    mov r15, rsi ; base
    
    ; setup the stack
    push rbp
    mov rbp, rsp

    ; check for invalid argument
    cmp r14d, 0
    jl .error

    ; check for null pointer
    cmp r15, 0
    je .error

    ; get the size of the base
    call my_strlen

    ; invalid base, one char
    cmp r11, 1
    jbe .error

    ; get the digits in the given base
    xor r10, r10
    .loop:
    
        ; do the divison & the modulo
        mov eax, r14d
        cdq
        idiv r11
        
        ; get the digit to print & store it in the stack
        xor r10, r10
        mov r10b, [r15 + rdx]
        push r10

        ; get the divided nbr
        mov r14d, eax

        ; while nbr > 0
        cmp r14d, 0
        jg .loop

    ; print the digits
    .print_loop:
        ; get the char from the stack
        xor r10, r10
        pop r10
        mov [char], r10b
        
        ; print the char
        mov rax, 1      ; write
        mov rdi, 1      ; stdout
        mov rsi, char   ; buff
        mov rdx, 1      ; size
        syscall

        ; check the print of the digit
        cmp rax, 1
        jne .error

        ; if the stack has the same level like at the start of the function
        cmp rbp, rsp
        jne .print_loop

.return: ; normal return -> 0
    ; reset the stack
    mov rsp, rbp
    pop rbp
    
    xor eax, eax
    ret

.error: ; error return -> -1
    ; reset the stack
    mov rsp, rbp
    pop rbp
    
    mov eax, -2
    ret
