.global find_lonely

find_lonely:
    movq $0, %rax
    
.L2:
    cmpq $0, %rsi
    je .end
    xor (%rdi), %rax
    add $8, %rdi
    sub $1, %rsi
    jmp .L2
    
.end:
    ret
