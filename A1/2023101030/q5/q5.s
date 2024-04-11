.global product_except_i
.text

# long long int* arr stored in %rdi, long long int* res stored in %rsi and long long int n stored in %rdx

# assumption: if n == 1, then the result will always be 1

product_except_i:
    movq %rsi, %rax # storing the pointer to the array int the return register
    movq $0, %r9    # intialising the counter register for the outer for loop

.L1:
    cmpq %r9, %rdx  # checking if the inner counter register is equal to n
    je .endf    # function is over
    movq $1, %r11   # initalising the register that stores the prod
    movq $0, %r12   # initalising the inner counter register to 0
    movq %rdi, %r8  # storing the pointer to arr in a new register

.L2:
    cmpq %r12, %rdx # checking if the inner counter register is equal to n
    je .endm    # inner loop is completed
    cmpq %r12, %r9  # checking if the inner counter register is pointing at the index which we need to find the product of all other elements
    je .increment   # incrementing all neccessary registers
    imulq (%r8), %r11 # multiplying the neccessary elements 
    je .increment   # incrementing all neccessary registers

.increment:
    addq $8, %r8    # pointing to the next element in the arr array
    inc %r12    # incrementing the inner counter register
    jmp .L2 # jumping back to the inner loop

.endm:  # inner loop is over, and prod is calculated
    movq %r11, (%rsi) # storing the prod of everything except the ith index of arr in the ith index of res
    addq $8, %rsi   # incrementing the pointer of res to store at the correct positon 
    inc %r9 # incrementing the outer counter register
    jmp .L1 # jumping back to the outer loop

.endf:
    ret # returning the pointer to res

