.global palindrome
.text 

# char* arr stored in %rdi and int n stored in %rsi

palindrome:
    movq %rdi, %r9  # stored first element in %r9
    subq $1, %rsi   # stored n-1 in rsi
    addq %rsi, %rdi # incremented rdi pointer to the last element or n-1 th index
    movq %rdi, %r10 # stored last element in %r10

.L2:
    cmp %r9, %r10   # checked if %r9 was less or equal to %r10, if it was then moving to the good ending
    jle .endg
    movb (%r9), %r12b   # storing character at i th index
    movb (%r10), %r13b  # storing character at n-i th index
    cmpb %r12b, %r13b   # comparing the values
    jne .endb # if they arent equal then move to the bad ending
    inc %r9 # change first index to i+1
    dec %r10    # change second index to n-i - 1
    jmp .L2 # continue the loop

.endg:  # good ending
    movq $1, %rax   # return 1
    ret

.endb:  # bad ending
    movq $0, %rax   # return 0
    ret

