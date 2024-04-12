.global game
.text 

# &str[0] is stored in %rdi and long long n is stored in %rsi

game:
    movq %rsi, %r14
    movq $0, %rax

.start:
    cmpq $0,%r14
    je .end
    movzbq (%rdi), %r9
    cmpq $43, %r9
    je .plus
    cmpq $67, %r9
    je .c
    cmpq $68, %r9
    je .d
    subq $48, %r9
    pushq %r9
    addq $1, %rdi
    subq $1, %r14
    jmp .start

.plus:
    popq %r10
    popq %r11
    movq %r10, %r12
    addq %r11,%r12
    pushq %r11
    pushq %r10
    pushq %r12
    addq $1, %rdi
    subq $1, %r14
    jmp .start

.c:
    popq %r10
    addq $1, %rdi
    subq $1, %r14
    subq $2, %rsi
    jmp .start

.d:
    popq %r10
    movq %r10, %r11
    addq %r10, %r11
    pushq %r10
    pushq %r11
    addq $1, %rdi
    subq $1, %r14
    jmp .start

.end:
    cmpq $0,%rsi
    je .endf
    popq %r10
    addq %r10,%rax
    subq $1,%rsi
    jmp .end

.endf:
    ret
    
