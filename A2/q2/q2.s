.global comb
.text

# long long int n stored in %rdi, long long int r stored in %rsi

comb:
    cmpq $0,%rsi # if r == 0, base case
    je end_factorial

factorial:
    cmpq $0,%rsi # if r == 0, base case
    je end_factorial

    pushq %rdi # push n
    pushq %rsi # push r

    decq %rdi # n--
    decq %rsi # r--
    
    call factorial

    popq %r10 # pop r
    popq %r11 # pop n

    imulq %r11, %rax # n * factorial(n-1)
    movq $0,%rdx # clear rdx
    idivq %r10 # n! / r
    ret
   
end_factorial:
    movq $1, %rax # return 1
    ret    
