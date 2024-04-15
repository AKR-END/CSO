.global max_subarray
.text

# %rdi stores &arr[0], %rsi stores n, %rdx stores l, %rcx stores r, %r8 stores &deque[0], %r9 stores &pre[0]

max_subarray:
    

    movq $0,(%r9)   # pre[0] = 0
    addq $1,%r12    # count = 1
    movq $0,%r13    # count - 1

    jmp .for

.for:
    cmpq %rsi,%r12   # if count == n
    jg .deque

    movq (%r9,%r13,8),%r14 
    addq (%rdi,%r13,8),%r14 
    movq %r14,(%r9,%r12,8) # pre[i] = sum

    addq $1,%r12    # count++
    addq $1,%r13
    jmp .for

.deque:
    movq %rdx,%r12  # count = l
    movq $0, %r13 # count - l
    movq $0,%r10 # dl = 0
    movq $0, %r11 # dr = 0
    movq $-100000000,%rax  # ans = -100000000

.Check:
    cmpq %rsi,%r12  # if count == n
    jg .end

.while:
    cmpq %r10,%r11  # if dl == dr
    je .loop

    movq -8(%r8, %r11, 8), %r15             
    movq (%r9, %r15, 8), %r14 
    movq (%r9,%r13,8),%r15 

    cmpq %r15,%r14 # if pre[count - l] < pre[deque[dr - 1]]
    jle .loop

    decq %r11 # dr--
    jmp .while

.loop:
    movq %r13,(%r8,%r11,8)
    incq %r11
    
    cmpq %r10,%r11
    jle .ans

    movq %r12,%r14
    subq %rcx,%r14
    movq (%r8,%r10,8),%r15
    cmpq %r15,%r14
    jle .ans
    
    incq %r10

.ans:
    movq (%r9,%r10,8),%r15
    movq (%r8,%r12,8),%r14
    subq (%r8,%r15,8),%r14

    cmpq %r14,%rax
    cmovl %r14,%rax

    incq %r12
    incq %r13
    jmp .Check

.end:
    ret

