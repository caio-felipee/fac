.data
    nl: .asciiz "\n"
    guess: .space 256
    answer: .space 256

.text
main:
    # Leitura de N em $t0
    li $v0, 5
    syscall

    move $t0, $v0

    # Leitura das strings
    la $a0, guess
    li $v0, 8
    syscall

    la $a0, answer
    li $v0, 8
    syscall

    move $a0, $t0
    la $a1, guess
    la $a2, answer
    jal solve

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall 

solve:
    li $t1, 0
    # Ans = t1
    loop:
        addi $a0, -1
        slt $t0, $a0, $zero
        bne $zero, $t0, end

        # Salvar valores em $t2 e $t3
        add $t2, $a0, $a1
        add $t3, $a0, $a2

        lb $t2, 0($t2)
        lb $t3, 0($t3)

        beq $t2, $t3, sum
        j loop
        sum:
            addi $t1, 1
        j loop
    end:
        move $v0, $t1
        jr $ra