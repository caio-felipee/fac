# Pneu
.data
    nl: .asciiz "\n"

.text
main:
    # Ler o primeiro input para o registrador $t0
    li $v0, 5
    syscall
    move $t0, $v0

    # Ler o segundo input para o registrador $t1
    li $v0, 5
    syscall
    move $t1, $v0

    # Gerar o resultado da subtração em $t2
    sub $t2, $t0, $t1

    # Mostrar resposta!
    li $v0, 1
    move $a0, $t2
    syscall

    # Mostrar uma quebra de linha
    li $v0, 4
    la $a0, nl
    syscall

    # Encerrar instrução
    li $v0, 10
    syscall