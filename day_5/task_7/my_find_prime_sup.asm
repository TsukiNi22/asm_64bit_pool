section .text
    global my_find_prime_sup
    extern is_prime

is_prime:
    xor r10, r10
    mov r10d, 2
    .loop:
        cmp r10d, edi
        je .true
        
        mov eax, edi
        cdq
        idiv r10d
    
        cmp edx, 0
        je .false

        inc r10d
        jmp .loop

.true:
    mov rax, 1
    ret

.false:
    xor rax, rax
    ret

my_find_prime_sup:
    mov ebx, edi
    mov rax, 2

    cmp ebx, 2
    jl .return_min_prime

    mov r11d, edi
    .loop:
        inc r11d
        jo .overflow
        
        mov edi, r11d
        call is_prime

        cmp rax, 1
        je .return

        jmp .loop

.return:
    xor rax, rax
    mov eax, r11d
    ret

.return_min_prime:
    mov rax, 2
    ret

.overflow:
    mov rax, -1
    ret
