section .text
    global my_sort_int_array

swap:
    mov eax, [r10 + 4 * r12]
    xchg eax, [r10 + 4 * r12 + 4 * 1]
    mov [r10 + 4 * r12], eax

my_sort_int_array:
    mov r10, rdi ; array
    mov r11, rsi ; size
    dec r11

    cmp r10, 0
    je .return

    xor r12, r12
    xor rax, rax
    .loop:
        
        mov r14d, [r10 + 4 * r12]
        mov r15d, [r10 + 4 * r12 + 4 * 1]

        cmp r14d, r15d
        jle .skip
        
        call swap
        mov rax, 1    

    .skip:
        inc r12
        cmp r12, r11
        jl .loop

    cmp rax, 0
    je .return

    xor r12, r12
    xor rax, rax
    jmp .loop

.return:
    ret
