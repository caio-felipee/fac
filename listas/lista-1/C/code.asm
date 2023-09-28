.data
    nl: .asciiz "\n"

.text
main:
    # Leitura dos dados D, A, N em t0, t1 e t2
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 5
    syscall
    move $t2, $v0

    # $t3 = ((N * A) - A) + D
    mul $t3, $t2, $t1
    sub $t3, $t3, $t1
    add $t3, $t0, $t3

    # $t4 = 32 - D
    li $t4, 32
    sub $t4, $t4, $t2

    # $t5 = $t3 * $t4
    mul $t5, $t3, $t4

    # Mostrar a resposta
    li $v0, 1
    move $a0, $t5
    syscall

    # Mostrar quebra de linha
    li $v0, 4
    la $a0, nl
    syscall

    # Encerrar instrução
    li $v0, 10
    syscall