.global find_lonely

find_lonely:
    movq (%rdx), %rax 
    .L2:
        addq $8, %rdx 
        xorq (%rdx), %rax
        subq $1, %rsi
        cmpq $0, %rsi 
        jge .L2 
        ret
    