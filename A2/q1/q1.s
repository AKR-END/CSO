.global max_subarray
.text

# %rdi stores &arr[0], %rsi stores n, %rdx stores l, %rcx stores r, %r8 stores &deque[0], %r9 stores &pre[0]

max_subarray:
    xorq %r10,%r10  # sum = 0
    xorq %r11,%r11  # count = 0
    movq $-100000000,%rbx # max = -100000000
    movq $0, %r14   # dl = 0
    movq $0, %r15   # dr = 0

    movq %rdi,%r11  # r11 = &arr[0]

    movq %r9, %r12  # r12 = &pre[0]
    movq $0, %r13    # r13 = 0
    movq %r13, %r12 # pre[0] = 0
    addq $8,%r12    # pre++

    jmp .for

.for:
    cmpq %rsi,%r11 # if count == n
    je .deque
    movq (%r11),%r13 # r13 = arr[i]
    addq %r13,%r10  # sum += arr[i]
    movq %r10,(%r12) # pre[i] = sum
    addq $8,%r11    # i++
    addq $8,%r12    # pre++
    incq %r11       # count++
    jmp .for

.deque:
    movq %rdx,%r11  # count = l
    
