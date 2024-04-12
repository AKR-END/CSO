.global comb
.text

# long long int n stored in %rdi, long long int r stored in %rsi

comb:
 cmpq $0,%rsi
    je end_factorial

factorial:
    cmpq $0,%rsi
    je end_factorial
    
    pushq %rdi
    pushq %rsi

    decq %rdi
    decq %rsi
    
    call factorial

    popq %r10
    popq %r11

    imulq %r11, %rax
    movq $0,%rdx
    idivq %r10
    ret
   
end_factorial:
    movq $1, %rax
    ret    
