section .rodata
    null_error_msg      db "The given pointer is null!", 10, 0
    overflow_error_msg  db "The number is too big to fit in a 32bit integer!", 10, 0
    
    INT_MAX equ 2147483647

section .text
    global my_getnbr
    extern putstr

my_getnbr:
    ; ptr == NULL
    mov r10, rdi
    cmp r10, 0
    je .error_ptr

    mov rax, 1 ; -1 or 1
    xor r11, r11 ; index
    
    ; Get the signe and start of the number
    .loop_get_signe:
        mov bl, [r10 + r11] ; get the char
        inc r11 ; r11++
        
        ; c == '\0'
        cmp bl, 0
        je .return
        
        ; c == '-'
        cmp bl, '-'
        jne .check_digit

        mov rbx, -1
        imul rbx

    .check_digit:

        ; c < '0'
        cmp bl, '0'
        jl .loop_get_signe
        
        ; c > '9'
        cmp bl, '9'
        jg .loop_get_signe
        
        jmp .out_get_signe

.out_get_signe:
    mov r12, rax
    xor rax, rax
    dec r11

    .loop:
        xor rbx, rbx
        mov bl, [r10 + r11] ; get the char
        inc r11

        ; c < '0'
        cmp bl, '0'
        jl .out
        
        ; c > '9'
        cmp bl, '9'
        jg .out

        sub bl, '0'
        imul rax, rax, 10
        add rax, rbx

        mov rdx, INT_MAX + 1
        cmp rax, rdx
        jg .error_overflow

        jmp .loop

.out:
    
    ; set the signe
    imul r12
    
    cmp rax, INT_MAX
    jg .error_overflow

.return:
    ret

.error_ptr:
    mov rdi, null_error_msg
    call putstr
    jmp .error

.error_overflow:
    mov rdi, overflow_error_msg
    call putstr
    jmp .error

.error:
    xor rax, rax
    ret
