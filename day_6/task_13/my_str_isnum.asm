; local var definition
c1_offset   equ 0   ; bool - is 0-9

; bool definition
false   equ 0
true    equ 1

; ascii const definition
char_0  equ 48
char_9  equ 57

section .text
    global my_str_isnum

my_str_isnum:
    mov r15, rdi ; str
    
    ; null error
    cmp r15, 0
    je .null
    
    ; setup the stack
    push rbp
    mov rbp, rsp

    ; alloc local var
    sub rsp, 16
    
    ; init local var
    mov byte [rsp + c1_offset], false

    ; init the index
    xor r10, r10
    .loop:
        
        ; get the char at i / str[i]
        mov r11b, [r15 + r10]
        
        ; char is '\0'
        cmp r11b, 0
        je .true

        ; setup the c1 condition
        mov byte [rsp + c1_offset], false
        cmp r11b, char_0
        jb .skip_c1
        cmp r11b, char_9
        ja .skip_c1
        mov byte [rsp + c1_offset], true
    .skip_c1:
        
        cmp byte [rsp + c1_offset], false
        je .false

        inc r10
        jmp .loop

.true:   
    ; reset the stack
    mov rsp, rbp
    pop rbp

    mov rax, true
    ret

.false:
    ; reset the stack
    mov rsp, rbp
    pop rbp

    mov rax, false
    ret

.null:
    xor rax, rax
    ret
