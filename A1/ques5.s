.global product_except_i
.text

# long long int* arr stored in %rdi, long long int* res stored in %rsi and long long int n stored in %rdx

product_except_i:
    movq %rsi, %rax
    cmpq $1, %rdx
    le .end