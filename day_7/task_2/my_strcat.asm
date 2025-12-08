section .bss
    char resb 1

section .text
    global my_strcat

my_strlen: ; r11d -> len | r14 -> dest
    xor r11, r11
    .loop:
        inc r11
        cmp byte [r14 + r11], 0
        jne .loop
    ret

my_strcat:
    mov r14, rdi ; dest
    mov r15, rsi ; str
    
    ; check for invalid argument
    cmp r14, 0
    je .error
    cmp r15, 0
    je .error

    ; get the size of the base
    call my_strlen

    ; stup the dest
    xor r10, r10
    .loop:

        ; get the char
        mov al, [r15 + r10]
        mov [char], al

        ; add the char to the end of the dest
        mov [r14 + r11], al

        ; c == '\0'
        cmp byte [char], 0
        je .return

        ; i++, loop
        inc r10
        inc r11
        jmp .loop

.return: ; normal return -> str
    mov rax, r14
    ret

.error: ; error return -> NULL
    xor rax, rax
    ret
