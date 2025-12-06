; local var definition
start_word_offset   equ 0                       ; bool - is the start of a word
c1_offset           equ start_word_offset + 1   ; bool - is a-z
c2_offset           equ c1_offset + 1           ; bool - is A-Z
c3_offset           equ c2_offset + 1           ; bool - is 0-9

; bool definition
false   equ 0
true    equ 1

; ascii const definition
char_0      equ 48
char_9      equ 57
char_up_a   equ 65
char_up_z   equ 90
char_low_a  equ 97
char_low_z  equ 122

section .text
    global my_strcapitalize

my_strcapitalize:
    mov rax, rdi ; str

    cmp rax, 0
    je .null
    
    ; setup the stack
    push rbp
    mov rbp, rsp

    sub rsp, 16 ; alloc local var
    
    ; init local var
    mov byte [rsp + start_word_offset], false
    mov byte [rsp + c1_offset], false
    mov byte [rsp + c2_offset], false
    mov byte [rsp + c3_offset], false

    ; init of the index
    xor r10, r10
    .loop:

        ; get the char at i / str[i]
        mov r11b, [rax + r10]
        
        ; char is '\0'
        cmp r11b, 0
        je .return

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

        ; setup the c3 condition
        mov byte [rsp + c3_offset], false
        cmp r11b, char_0
        jb .skip_c3
        cmp r11b, char_9
        ja .skip_c3
        mov byte [rsp + c3_offset], true
    .skip_c3:

        ; change the char if the condition are meet
        
        ; for lower char
        cmp byte [rsp + c1_offset], false
        je .skip_1
        cmp byte [rsp + start_word_offset], true
        je .sub
        cmp r10, 0
        je .sub
        jmp .skip_1
    .sub: sub byte [rax + r10], 32
    .skip_1:

        ; for upper char
        cmp byte [rsp + c2_offset], false
        je .skip_2
        cmp byte [rsp + start_word_offset], true
        je .skip_2
        cmp r10, 0
        je .skip_2
        add byte [rax + r10], 32
    .skip_2:

        ; setup the start_word condition
        mov byte [rsp + start_word_offset], false
        cmp byte [rsp + c1_offset], true
        je .skip_start_word
        cmp byte [rsp + c2_offset], true
        je .skip_start_word
        cmp byte [rsp + c3_offset], true
        je .skip_start_word
        mov byte [rsp + start_word_offset], true
    .skip_start_word:

        inc r10
        jmp .loop

.return:
    ; reset the stack
    mov rsp, rbp
    pop rbp

    ret

.null:
    xor rax, rax
    ret
