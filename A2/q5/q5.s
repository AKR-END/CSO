.global bs
.text

# %rdi stores &arr[0] ,%rsi stores target and %rdx stores &iterations

bs:
    movq $31, %r9
    movq $0, %r10

.start:
    cmpq %r10,%r9
    jle .end
    movq (%rdx), %r14
    addq $1, %r14
    movq %r10, %r11
    addq %r9, %r11
    sarq $1, %r11
    movq %r11, %r15
    movq (%rdi,%r15,8), %r13
    cmpq %r13, %rsi
    je .rdec
    jg .rdec2
    jl .linc
    
.rdec:  
    movq %r11, %r9
    jmp .start

.rdec2:
    movq %r11, %r9
    decq %r9
    jmp .start

.linc:
    movq %r11, %r10
    incq %r10
    jmp .start

.end:
    movq %r10,%rax
    ret

