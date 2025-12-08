; local var definition
c1_offset   equ 0   ; bool - is printable char

; bool definition
false   equ 0
true    equ 1

; ascii const definition
char_limit_low  equ 31  ; SPACE
char_limit_up   equ 126 ; ~

section .bss
    char resb 1
    n_char resd 1

section .text
    global my_showstr
    extern my_putnbr_base

put_char:
    mov rax, 1      ; write
    mov rdi, 1      ; stdout
    mov rsi, char   ; buff
    mov rdx, 1      ; size
    syscall

    cmp rax, 1
    jne .error

.return:
    xor rax, rax
    ret

.error:
    mov rax, -1
    ret

put_non_printable_char:
    
    ; setup the non printable char
    mov al, [char]
    mov [n_char], al

    ; print the '\'
    mov byte [char], 92
    call put_char
    cmp rax, 0
    jne .error

    ; print the hexa value
    mov edi, [n_char]
    call my_putnbr_base
    cmp rax, 0
    jne .error

.return:
    xor rax, rax
    ret

.error:
    mov rax, -1
    ret

my_showstr:
    mov r15, rdi ; str

    ; setup the stack
    push rbp
    mov rbp, rsp

    ; alloc local var
    sub rsp, 16
    
    ; init local var
    mov byte [rsp + c1_offset], false

    ; check for null ptr
    cmp r15, 0
    je .error

    ; loop to print the str
    xor r13, r13
    .loop:

        ; get the char
        mov al, [r15 + r13]
        mov [char], al
        
        ; c == '\0'
        cmp byte [char], 0
        je .return

        ; setup the c1 condition
        mov byte [rsp + c1_offset], false
        cmp byte [char], char_limit_low
        jb .skip_c1
        cmp byte [char], char_limit_up
        ja .skip_c1
        mov byte [rsp + c1_offset], true
    .skip_c1:

        cmp byte [rsp + c1_offset], false
        je .non_printable_char
    
    .printable_char:
        call put_char
        cmp rax, 0
        jne .error
        jmp .do_loop
    
    .non_printable_char:
        call put_non_printable_char
        cmp rax, 0
        jne .error
        
    .do_loop:
        inc r13
        jmp .loop

.return:
    ; reset the stack
    mov rsp, rbp
    pop rbp

    xor rax, rax
    ret

.error:
    ; reset the stack
    mov rsp, rbp
    pop rbp
    
    mov rax, -1
    ret
