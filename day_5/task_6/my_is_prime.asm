section .text
    global my_is_prime

my_is_prime:
    cmp edi, 2
    jl .false

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
