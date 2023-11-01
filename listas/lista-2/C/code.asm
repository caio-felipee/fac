.data
    nl: .asciiz "\n"
    tnum: .asciiz "Teste "
    spc: .asciiz " "
    hash: .word 126

.text
main:
    # Cópia do endereço do meu vetor em $s7
    la $s7, hash
    
    # Salvar meu teste em $s6
    li $s6, 1

    for_loop:
        jal to_number
        # A e V em $s0, $s1
        move $s0, $v0
        move $s1, $v1

        or $t0, $s0, $s1
        beqz $t0, end_loop

        # Guardo meu MAX_VALUE em $s3
        li $s3, 0

        case_loop:
            # Encerro quando todos foram lidos
            beqz $s1, end_case_loop

            # Removo 1 da minha leitura
            addi $s1, -1

            jal to_number

            # Realizo a leitura do meu vetor e somo um
            sll $v0, $v0, 2
            sll $v1, $v1, 2
            add $v0, $s7, $v0
            add $v1, $s7, $v1

            lw $t0, 0($v0)
            lw $t1, 0($v1)

            addi $t0, 1
            addi $t1, 1

            sw $t0, 0($v0)
            sw $t1, 0($v1)

            bge $t0, $t1, max_t0
            move $t3, $t1
            j end_max_t0

            max_t0:
                move $t3, $t0
            end_max_t0:

            bge $t3, $s3, update_max
            j end_update_max

            update_max:
                move $s3, $t3
            end_update_max:

            j case_loop
        end_case_loop:
            # Printar o número do teste
            la $a0, tnum
            li $v0, 4
            syscall

            move $a0, $s6
            li $v0, 1
            syscall

            la $a0, nl
            li $v0, 4
            syscall
            
            la $a0, hash # Vetor Hash
            move $a1, $s3 # Valor Máximo
            move $a3, $s0 # Tamanho
            jal print_equals

            # Printa o fim da linha
            li $v0, 4
            la $a0, nl
            syscall

            # Printa outro fim da linha
            li $v0, 4
            la $a0, nl
            syscall

            addi $s6, 1
            li $s3, 0

        j for_loop
    
    end_loop:
    li $v0, 10
    syscall

print_equals:
    li $t0, 1
    move $t6, $a0

    equals_loop:
        slt $t1, $a3, $t0
        bne $zero, $t1, end_equals_loop

        # Salvar o endereço da posição em $t2
        sll $t2, $t0, 2
        add $t2, $t6, $t2

        # Salvar o valor da posição em $t3
        lw $t3, 0($t2)

        beq $t3, $a1, print

        j end_print
        print:
            move $a0, $t0
            li $v0, 1
            syscall

            la $a0, spc
            li $v0, 4
            syscall

        end_print:

        sw $zero, 0($t2)
        addi $t0, 1
        j equals_loop
    
    end_equals_loop:
        jr $ra

to_number:
    # Salvar os valores em $t0 e $t1, respectivamente
    li $t0, 0
    li $t1, 0


    first_loop:
        li $v0, 12
        syscall

        addi $v0, -48
        slt $t3, $v0, $zero
        # Verificar se é diferente de "caractere" $t4
        bne $t3, $zero, end_first_loop

        # Deslocar minha resposta em 1 posição
        mul $t0, $t0, 10
        add $t0, $t0, $v0

        j first_loop

    end_first_loop:

    second_loop:
        li $v0, 12
        syscall

        addi $v0, -48
        slt $t3, $v0, $zero
        bne $t3, $zero, end
 
        # Deslocar minha resposta em 1 posição
        mul $t1, $t1, 10
        add $t1, $t1, $v0
 
        j second_loop       

    end:
        move $v0, $t0
        move $v1, $t1
        jr $ra