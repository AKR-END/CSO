.global bs
.text

# %di stores &arr[0], %rsi stores targ and %rdx stores &iterations

bs:
    movq $0, %r8 # left
    movq $31, %r9 # right

    movswq %si, %rbx # targ, convert from 16-bit to 64-bit

    movq $-1, %rax # return value
    movq $0, %r10 # iterations

.while:
    cmpq %r8, %r9 # if left > right
    jle .end
    
    incq %r10 # increment iterations

    movq %r8, %r11 # mid = (left + right) / 2
    addq %r9, %r11 
    sarq $1, %r11

    movswq (%rdi,%r11,2), %r12 # arr[mid]

    cmpq %r12, %rbx # if arr[mid] == targ, arr[mid] > target, arr[mid] < target
    je .rdec 
    jl .rdec2
    jg .linc

.rdec:
    movq %r11, %r9 # right = mid
    jmp .while

.rdec2:
    movq %r11, %r9 # right = mid
    decq %r9 # right--
    jmp .while

.linc:
    movq %r11, %r8 # left = mid
    incq %r8 # left++
    jmp .while

.end:
    movq %r10, (%rdx) # store iterations
    movswq (%rdi,%r8,2), %r12 # arr[left]
    cmpq %r12, %rbx # if arr[left] == targ
    je .found
    movq $-1, %rax # return -1
    ret

.found:
    movq %r8, %rax # return left
    ret
