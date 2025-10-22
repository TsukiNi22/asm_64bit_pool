section .text
    global my_compute_power_it

my_compute_power_it:
    xor eax, eax
    cmp esi, 0
    jl .return

    mov eax, 1
    je .return
    
    xor r10d, r10d
    .loop:
        imul eax, edi
        jo .overflow

        inc r10d
        cmp r10d, esi
        jl .loop

.return:
    ret

.overflow:
    mov rax, 0
    ret
