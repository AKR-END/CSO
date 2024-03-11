.global find_lonely

find_lonely:
    mov %rdi, %rax 
    .L2:
        addq $8, %rdi 
        xor %rdi, %rax
        subq $1, %rsi
        cmpq $0, %rsi 
        jge .L2 
        ret
    