.global bs
.text

# %di stores &arr[0], %rsi stores targ and %rdx stores &iterations

bs:
    movq $0, %r8
    movq $31, %r9

    movswq %si, %rbx

    movq $-1, %rax
    movq $0, %r10

.while:
    cmpq %r8, %r9
    jle .end
    
    incq %r10

    movq %r8, %r11
    addq %r9, %r11
    sarq $1, %r11

    movswq (%rdi,%r11,2), %r12

    cmpq %r12, %rbx
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
    movswq (%rdi,%r8,2), %r12
    cmpq %r12, %rbx
    je .found
    movq $-1, %rax
    ret

.found:
    movq %r8, %rax
    ret
