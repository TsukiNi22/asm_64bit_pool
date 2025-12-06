; local var definition
c1_offset           equ 0               ; bool - is a-z
c2_offset           equ c1_offset + 1   ; bool - is A-Z

; bool definition
false   equ 0
true    equ 1

; ascii const definition
char_up_a   equ 65
char_up_z   equ 90
char_low_a  equ 97
char_low_z  equ 122

section .text
    global my_str_isalpha

my_str_isalpha:
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
    mov byte [rsp + c2_offset], false

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
        cmp r11b, char_low_a
        jb .skip_c1
        cmp r11b, char_low_z
        ja .skip_c1
        mov byte [rsp + c1_offset], true
    .skip_c1:
        
        ; setup the c2 condition
        mov byte [rsp + c2_offset], false
        cmp r11b, char_up_a
        jb .skip_c2
        cmp r11b, char_up_z
        ja .skip_c2
        mov byte [rsp + c2_offset], true
    .skip_c2:

        cmp byte [rsp + c1_offset], true
        je .skip
        cmp byte [rsp + c2_offset], true
        je .skip
        jmp .false
    .skip:

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
