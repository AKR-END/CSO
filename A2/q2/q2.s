.global comb
.text

# long long int n stored in %rdi, long long int r stored in %rsi


comb:
    cmpq $0, %rdi
    je .end
    cmpq %rsi, %rdi
    je .endb

recurse:
    pushq %rdi
    pushq %rsi
    decq %rdi
    call comb
    popq %rsi
    popq %rdi
    pushq %rax
    pushq %rdi
    decq %rsi
    call comb
    popq %rdi
    popq %rsi
    addq %rax, %rsp
    ret

.endb:
    movq $1, %rax
    ret
