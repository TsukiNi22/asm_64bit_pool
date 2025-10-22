section .text
    global my_compute_square_root

my_compute_square_root:
    xor rax, rax
    
    cmp edi, 0
    jl .return

    xor r10d, r10d
    .loop:

        cmp r10d, edi
        jg .return
        
        mov r11d, r10d
        imul r11d, r11d
        cmp r11d, edi
        jg .return
        je .return_root

        inc r10d
        jmp .loop

.return:
    ret

.return_root:
    mov eax, r10d
    ret
