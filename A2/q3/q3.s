.global postfix
.text

# &str[0] stored in %rdi an long long n stored in %rsi

postfix:
  cmpq $0,%rsi
  je .end
  movzbq (%rdi), %r9
  cmpq $43, %r9
  je .plus
  cmpq $45, %r9
  je .minus
  cmpq $42, %r9
  je .multi
  cmpq $47, %r9
  je .div
  cmpq $32, %r9
  je .space
  subq $48, %r9
  pushq %r9
  addq $1, %rdi
  subq $1, %rsi

.space:
  addq $1, %rdi
  subq $1, %rsi
  jmp postfix

.plus:
  popq %r10
  popq %r11
  addq %r11,%r10
  pushq %r10
  addq $1, %rdi
  subq $1, %rsi
  jmp postfix

.minus:
  popq %r10
  popq %r11
  subq %r10, %r11
  pushq %r11
  addq $1, %rdi
  subq $1, %rsi
  jmp postfix


.multi:
  popq %r10
  popq %r11
  imulq %r11,%r10
  pushq %r10
  addq $1, %rdi
  subq $1, %rsi
  jmp postfix
  
.div:
  popq %r10
  popq %r11
  movq %r11,%rax
  movq $0,%rdx
  idivq %r10
  pushq %rax
  addq $1, %rdi
  subq $1, %rsi
  jmp postfix

.end:
  popq %r10
  movq %r10,%rax
  ret
