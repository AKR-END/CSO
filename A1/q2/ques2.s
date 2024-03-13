.global rotate
.text

# long long int* arr stored in %rdi and int n stored in %rsi


rotate:
    movq %rdi, %rax
    movq (%rdi), %r10   # moving value of index 0 to a new register
    subq $1, %rsi

.L2:
    cmpq $0, %rsi
    je .end

    movq %rdi, %r9
    addq $8, %r9
    movq (%r9), %r11   # storing value of i+1 in new register

    movq %r11, (%rdi)  # storing value of i+1 into memory of i

    addq $8, %rdi
    subq $1, %rsi
    jmp .L2

.end:
    movq %r10, (%rdi)   # moving value in 0 to index n-1
    ret


    