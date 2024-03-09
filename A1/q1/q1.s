.global find_lonely
.text

// lli* arr is stored in %rdx and int n is stored in %rsi


find_lonely:
    movq %rdx, %rax 
    .L2:
        addq $8, %rdx 
        xorq %rdx, %rax
        subq $1, %rsi 
        cmpq $0, %rsi 
        jge .L2 
        ret