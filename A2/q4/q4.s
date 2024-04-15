.global game
.text 

# &str[0] is stored in %rdi and long long n is stored in %rsi

game:
    movq %rsi, %r14 # n
    movq $0, %rax # sum

.start:
    cmpq $0,%r14 # if n == 0
    je .end
    movzbq (%rdi), %r9 # r9 = *str
    cmpq $43, %r9 # if *str == '+'
    je .plus
    cmpq $67, %r9 # if *str == 'C'
    je .c
    cmpq $68, %r9 # if *str == 'D'
    je .d
    subq $48, %r9 # r9 = *str - '0'
    pushq %r9 # push *str
    addq $1, %rdi # str++
    subq $1, %r14 # n--
    jmp .start

.plus:
    popq %r10 # pop prev number
    popq %r11 # pop the number prev to before
    movq %r10, %r12 # r12 = prev number
    addq %r11,%r12 # r12 = prev number + number prev to before
    pushq %r11 # push number prev to before
    pushq %r10 # push prev number
    pushq %r12 # result
    addq $1, %rdi # next character
    subq $1, %r14 # n--
    jmp .start

.c:
    popq %r10 # pop prev number
    addq $1, %rdi # next character
    subq $1, %r14 # n--
    subq $2, %rsi # n -= 2, as 2 numbers are lost in the process
    jmp .start

.d:
    popq %r10 # pop prev number
    movq %r10, %r11 # r11 = prev number
    addq %r10, %r11 # r11 = 2 * prev number
    pushq %r10 # push prev number
    pushq %r11 # push 2 * prev number
    addq $1, %rdi # next character
    subq $1, %r14 # n--
    jmp .start

.end:
    cmpq $0,%rsi # if n == 0
    je .endf
    popq %r10 # pop the last number
    addq %r10,%rax # sum += last number
    subq $1,%rsi # n--
    jmp .end

.endf:
    ret
    
