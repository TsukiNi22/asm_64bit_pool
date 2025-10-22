section .text
    global my_compute_factorial_it

my_compute_factorial_it:
    mov rbx, rdi
    
    xor rax, rax
    cmp rbx, 12
    jg .return
    cmp rbx, 0
    jl .return

    mov rax, 1
    je .return
    
    xor r10, r10
    .loop:
        inc r10
        
        imul r10

        cmp r10, rbx
        jl .loop

.return:
    ret
