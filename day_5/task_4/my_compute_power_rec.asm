section .text
    global my_compute_power_rec

rec:
    imul eax, edi
    jo .return
    
    inc r10d
    cmp r10d, esi
    jge .return
    
    call rec

.return:
    ret

my_compute_power_rec:
    xor eax, eax
    cmp esi, 0
    jl .return

    mov eax, 1
    je .return
    
    xor r10d, r10d
    call rec
    jo .overflow

.return:
    ret

.overflow:
    mov rax, 0
    ret
