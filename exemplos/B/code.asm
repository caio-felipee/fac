.data
    nl: .asciiz "\n"
    vs: .word 1 4 3 9 12 15
    size: .word 6

.text
main:
    li $a0, 0
    la $a1, size
    lw $a1, 0($a1)
    la $a2, vs
    li $t3, 0

    jal average
    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

average:
    # Comparo para ver se dou break
    slt $t0, $a0, $a1
    beq $t0, $zero, end

    sll $t1, $a0, 2
    add $t1, $a2, $t1

    lw $t2, 0($t1)

    add $t3, $t3, $t2
    addi $a0, $a0, 1

    j average
    
    end:
        move $v0, $t3
        jr $ra