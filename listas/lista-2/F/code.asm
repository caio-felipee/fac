.data
    nl: .asciiz "\n"

.text
main:
    li $a0, 9000
    jal contaBits

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

contaBits:
    li $t0, 32
    li $t1, 1
    li $t3, 0
    # t3 = ans

    loop:
        beq $zero, $t0, end
        and $t2, $a0, $t1
        
        slt $t4, $zero, $t2
        add $t3, $t4, $t3

        addi $t0, -1
        srl $a0, $a0, 1

        j loop
    end:
        move $v0, $t3
        jr $ra