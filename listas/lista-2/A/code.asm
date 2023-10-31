.data
    nl: .asciiz "\n"
    buffer: .space 5

.text
main:
    # Ler N em $t0
    li $v0, 5
    syscall

    move $t0, $v0

    loop:
        beq $t0, $zero, end2
        addi $t0, -1
        # Ler string em $a0
        li $v0, 8
        la $a0, buffer
        syscall

        # Salvar primeiro elemento da string em $t1
        lb $t1, 0($a0)
        lb $t2, 2($a0)

        beq $t1, $t2, equal

        li $a0, 2
        j end

        equal:
            li $a0, 1
        end:

        li $v0, 1
        syscall

        li $v0, 4
        la $a0, nl
        syscall

        j loop

    end2:

    li $v0, 10
    syscall