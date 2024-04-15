.global bs
.text

# %rdi stores &arr[0], %rsi stores targ and %rdx stores &iterations

bs:
    movq $0, %r8
    movq $31, %r9

    movq $-1, %rax
    movq $0, %r10

.while:
    cmpq %r8, %r9
    jle .end
    
    incq %r10

    movq %r8, %r11
    addq %r9, %r11
    sarq $1, %r11

    movq (%rdi,%r11,8), %r12

    cmpq %r12, %rsi
    je .rdec
    jl .rdec2
    jg .linc

.rdec:
    movq %r11, %r9
    jmp .while

.rdec2:
    movq %r11, %r9
    decq %r9
    jmp .while

.linc:
    movq %r11, %r8
    incq %r8
    jmp .while

.end:
    movq %r10, (%rdx)
    movq (%rdi,%r8,8), %r12
    cmpq %r12, %rsi
    je .found
    movq $-1, %rax
    ret

.found:
    movq %r8, %rax
    ret
