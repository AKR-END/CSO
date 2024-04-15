.global postfix
.text

# &str[0] stored in %rdi an long long n stored in %rsi

postfix:
  cmpq $0,%rsi # if n == 0
  je .end # return 0
  movzbq (%rdi), %r9 # load the character
  cmpq $43, %r9 # if the character is '+'
  je .plus
  cmpq $45, %r9 # if the character is '-'
  je .minus
  cmpq $42, %r9 # if the character is '*'
  je .multi
  cmpq $47, %r9 # if the character is '/'
  je .div
  cmpq $32, %r9 # if the character is ' '
  je .space
  subq $48, %r9 # convert the character to long long
  pushq %r9 # push to stack
  addq $1, %rdi # next character
  subq $1, %rsi # n--

.space:
  addq $1, %rdi # next character
  subq $1, %rsi # n--
  jmp postfix

.plus:
  popq %r10 # pop the first number
  popq %r11 # pop the second number
  addq %r11,%r10 # add the two numbers
  pushq %r10 # push the result
  addq $1, %rdi # next character
  subq $1, %rsi # n--
  jmp postfix

.minus:
  popq %r10 # pop the first number
  popq %r11 # pop the second number
  subq %r10, %r11 # subtract the two numbers
  pushq %r11 # push the result
  addq $1, %rdi # next character
  subq $1, %rsi # n--
  jmp postfix


.multi:
  popq %r10 # pop the first number
  popq %r11 # pop the second number
  imulq %r11,%r10 # multiply the two numbers
  pushq %r10 # push the result
  addq $1, %rdi # next character
  subq $1, %rsi # n--
  jmp postfix
  
.div:
  popq %r10 # pop the first number
  popq %rax # pop the second number
  cqto # concatonates rdx and rax for division
  idivq %r10 # divides rax by r10
  pushq %rax # push the result
  addq $1, %rdi # next character
  subq $1, %rsi # n--
  jmp postfix

.end:
  popq %r10 # pop the result
  movq %r10,%rax 
  ret
