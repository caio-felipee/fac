.data
    nl: .asciiz "\n"
    vector: .word 13 13 13 13 13 31 31 31 31 31 31
.text
main:
    la $a0, vector
    li $a1, 11

    jal elemDistintos

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

elemDistintos:
    # Enquanto o i for igual a i - 1, não incrementar
    # Resultado começa em 1, salvo em $t0
    li $t0, 1
    li $t1, 1
    # t1 = i

    loop:
        beq $t1, $a1, end
        
        # Salvar elemento v[i - 1] em $t2
        # Salvar elemento v[i] em $t3
        sll $t2, $t1, 2
        sll $t3, $t1, 2

        addi $t2, -4
        add $t2, $t2, $a0
        add $t3, $t3, $a0

        lw $t2, 0($t2)
        lw $t3, 0($t3)

        # Incrementar 1 em i
        addi $t1, 1

        bne $t2, $t3, sum
        j loop
        sum:
            addi $t0, 1
        j loop

    end:
        move $v0, $t0
        jr $ra