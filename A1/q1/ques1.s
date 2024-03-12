.global find_lonely

find_lonely:
    movq (%rdi), %rax 
    .L2:
        addq $8, %rdi
        movq (%rdi),%r10
        xor %r10,%rax
        subq $1, %rsi
        cmpq $0, %rsi 
        jg .L2 
        ret
    