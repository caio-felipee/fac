.data
    nl: .asciiz "\n"
    yes: .asciiz "Yes\n"
    no: .asciiz "No\n"

.text
main:
    # $t0 -> a
    # $t1 -> b
    # $t2 -> c

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0
 
    li $v0, 5
    syscall
    move $t2, $v0

    # $t3 = a + b
    add $t3, $t0, $t1

    # a + b == c
    beq $t3, $t2, print_yes

    la $a0, no
    j end
    
    print_yes:
        la $a0, yes

    end:

    li $v0, 4
    syscall

    li $v0, 10
    syscall
