.data
    nl: .asciiz "\n"

.text
main:
    # Ler o número N em $t0
    li $v0, 5
    syscall

    move $t0, $v0

    # Lê o primeiro elemento como o maior número em $s0
    li $v0, 5
    syscall

    move $s0, $v0

    # Realiza o for loop
    loop:
        addi $t0, -1
        beq $zero, $t0, end

        # Lê o elemento em $t1
        li $v0, 5
        syscall

        move $t1, $v0

        # Compara o meu maior número ($s0) com o candidato ($t1)
        bgt $t1, $s0, swap
        j loop

        swap:
            move $s0, $t1

        j loop
    end:

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall