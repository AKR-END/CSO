.global max_subarray
.text

# %rdi stores &arr[0], %rsi stores n, %rdx stores l, %rcx stores r, %r8 stores &deque[0], %r9 stores &pre[0]

max_subarray:
    movq $0,(%r9)   # pre[0] = 0
    movq $1,%rbx    # count = 1
    movq $0,%r13    # count - 1

    jmp .for

.for:
    cmpq %rsi,%rbx   # if count == n
    jg .deque

    movq (%r9,%r13,8),%r14 # pre[count - 1]
    addq (%rdi,%r13,8),%r14 # pre[count - 1] + arr[count - 1] = sum
    movq %r14,(%r9,%rbx,8) # pre[count] = sum

    addq $1,%rbx    # count++
    addq $1,%r13   # count - 1++
    jmp .for

.deque:
    movq %rdx,%rbx  # count = l
    movq $0, %r13 # count - l
    movq $0,%r10 # dl = 0
    movq $0, %r11 # dr = 0
    movq $-100000000,%rax  # ans = -100000000

.Check:
    cmpq %rsi,%rbx  # if count == n
    jg .end

.while:
    cmpq %r10,%r11  # if dl == dr
    je .loop

    movq -8(%r8, %r11, 8), %r15 # deque[dr - 1]            
    movq (%r9, %r15, 8), %r14 # pre[deque[dr - 1]] 
    movq (%r9,%r13,8),%r15 # pre[count - l]

    cmpq %r15,%r14 # if pre[count - l] < pre[deque[dr - 1]]
    jle .loop

    decq %r11 # dr--
    jmp .while

.loop:
    movq %r13,(%r8,%r11,8) # deque[dr] = count - l
    incq %r11 # dr++
    
    cmpq %r10,%r11 # if dl >= dr
    jle .ans

    movq %rbx,%r14 # count
    subq %rcx,%r14 # count - r
    movq (%r8,%r10,8),%r15 # deque[dl]
    cmpq %r15,%r14 # if deque[dl] <= count - r
    jle .ans
    
    incq %r10 # dl++

.ans:
    movq (%r8,%r10,8),%r15 # deque[dl]
    movq (%r9,%rbx,8),%r14 # pre[count]
    subq (%r9,%r15,8),%r14 # pre[count] - pre[deque[dl]]

    cmpq %r14,%rax # if ans < pre[count] - pre[deque[dl]]
    cmovl %r14,%rax # ans = pre[count] - pre[deque[dl]

    incq %rbx # count++
    incq %r13 # count - l++
    jmp .Check

.end:
    ret

