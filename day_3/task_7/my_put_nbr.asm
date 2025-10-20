section .data
    index db 0

section .bss
    char resb 1
    digit resb 1

section .text
    global my_put_nbr

print_char:
    push rbp
    mov rbp, rsp

    mov byte [char], sil

    mov rax, 1
    mov rdi, 1
    lea rsi, byte [char]
    mov rdx, 1
    syscall

    cmp rax, 1
    jne .error

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

.error:
    mov rsp, rbp
    pop rbp
    mov rax, 1
    ret

set_digit:
    push rbp
    mov rbp, rsp   

    mov eax, ebx
    xor rdx, rdx
    mov r10, 10
    div r10

    mov ebx, eax
    mov byte [digit], dl
    
    mov rsp, rbp
    pop rbp
    ret

my_put_nbr:
    push rbp
    mov rbp, rsp

    mov ebx, edi

    cmp ebx, 2147483649
    jb .loop_push

    mov eax, ebx
    imul eax, -1
    mov ebx, eax

    mov sil, '-'
    call print_char
        
    cmp rax, 0
    jne .error

    .loop_push:
        
        call set_digit

        add byte [digit], '0'
        movzx r10, byte [digit]
        push r10
        inc byte [index]
        
        cmp ebx, 0
        jg .loop_push

    .loop_pop:
        
        pop r10
        mov byte [digit], r10b
        dec byte [index]

        mov sil, byte [digit]
        call print_char
        
        cmp rax, 0
        jne .error
        
        cmp byte [index], 0
        jg .loop_pop

    mov sil, 10
    call print_char

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

.error:
    mov rsp, rbp
    pop rbp
    mov rax, 1
    ret
 
