.global sum_max_min
.text

# long long int* arr is stored in %rdi and long long int n is stored in %rsi
# max stored in %r9 and min stored in %r10

sum_max_min:
    movq (%rdi), %r9
    movq (%rdi), %r10

.L2:
    cmpq $0, %rsi
    jle .end
    movq (%rdi), %r11
    cmpq %r9, %r11
    jg .max
    cmpq %r10, %r11
    jl .min
    dec %rsi
    addq $8, %rdi
    jmp .L2

.max:
    movq %r11, %r9
    dec %rsi
    addq $8, %rdi
    jmp .L2

.min:
    movq %r11, %r10
    dec %rsi
    addq $8, %rdi
    jmp .L2

.end:
    movq %r9, %rax
    addq %r10, %rax
    ret

