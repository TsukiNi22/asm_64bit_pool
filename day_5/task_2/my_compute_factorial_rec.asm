section .text
    global my_compute_factorial_rec

rec:
    inc r10
    imul r10

    cmp r10, rbx
    jge .return

    call rec

.return
    ret

my_compute_factorial_rec:
    mov rbx, rdi
    
    xor rax, rax
    cmp rbx, 12
    jg .return
    cmp rbx, 0
    jl .return

    mov rax, 1
    je .return
    
    xor r10, r10
    call rec

.return:
    ret
