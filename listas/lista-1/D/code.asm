.data 
    nl: .asciiz "\n"
    ls: .word 10 11 12 13 14 15 16 17 18 19 20

.text 
main:
    la $s0, ls

    # Leitura de i, j, N em $t0, $t1, $t2
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 5
    syscall
    move $t2, $v0

    # Multiplicamos i e j pela quantidade de bits (4)
    sll $t0, $t0, 2
    sll $t1, $t1, 2

    # Leitura de A[j] em $t4
    add $t3, $s0, $t1
    lw $t4, 0($t3)

    # Recebemos o novo valor de A[i] em $t5
    add $t5, $t4, $t2

    # Assinalamos o novo valor em A[i]
    add $t6, $s0, $t0
    sw $t5, 0($t6)

    # Printamos para teste
    lw $t7, 0($t6)
    li $v0, 1
    move $a0, $t7
    syscall

    # Encerramos o processo
    li $v0, 10
    syscall
