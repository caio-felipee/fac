# Ola Mundo

.data
msg: .asciiz "Ola Mundo\n"

.text
main:
    la $a0, msg
    li $v0, 4
    syscall
    li $v0, 10
    syscall