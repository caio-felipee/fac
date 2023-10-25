## Chamada a procedimentos

1. Coloque parâmetros nos registradores
2. Desvie a execução para o procedimento
3. Ajuste o armazenamento
4. Execute o procedimento
5. Armazene o resultado nos registradores
6. Ajuste o armazenamento
7. Retorne ao procedimento chamador

### Inserir na Pilha

- Ex: Salvar $s0 e $s1 na pilha

```asm
# Abrir espaço
addi $sp, $sp, -8 # sp = sp - 8

# Salva na pilha
sw $s0, 0($sp) # M[sp] = s0
sw $s1, 4($sp) # M[sp + 4] = s1
```

### Retirar da Pilha

- Ex: Restaurar $s0 e $s1 da pilha

```asm
# Restaura os valores
lw $s0, 0($sp) # s0 = M[sp]
lw $s1, 4($sp) # s1 = M[sp + 4]

# Restaura o espaço na pilha
addi $sp, $sp, 8 # sp = sp + 8
```

### Chamada a Procedimentos

1. Desvia para o procedimento

```asm
jal procedimento
```

*jal* = jump and link
</br>
*ra* = return address

- Salva o endereço de retorno em $ra
- Faz o desvio para o rótulo procedimento.

### Retorna ao Chamador

```asm
jr $ra
```

*jr* = jump register (jump to return address)

- Faz o desvio para o endereço de retorno em $ra
- Exemplo:

```c
int media(int a, int b) {
    return (a + b) / 2;
}

int main() {
    int a = 1;
    int b = 2;

    printf("%d\n", media(a, b));
    return 0;
}
```

a = $s0
<br>
b = $s1

```asm
.data
    nl: .asciiz "\n"

.text
main:
    li $s0, 3
    li $s1, 2

    # Carrega args.
    move $a0, $s0
    move $a1, $s1
    
    # Chama procedimento
    jal media

    # Carrega resultado
    move $s2, $v0

    # Imprime resultado
    li $v0, 1
    move $a0, $s2
    syscall

    # Imprime nova linha
    li $v0, 4
    la $a0, nl
    syscall

media:
    add $t0, $a0, $a1 # t0 = a + b
    srl $v0, $t0, 1 # v0 = t0 / 2
    jr $ra
```

## Formato tipo-J

| OP | Endereço |
|:--:|:--------:|
| 6 bytes  |    26 bytes  |

- É o formato usado para instruções de desvio: `j`, `jal` e `jr`.

## Manipulação de caracteres

### Instruções de acesso a memória

- `lb`: load byte - carrega um byte da memória
- `sb`: store byte - armazena um byte na memória

#### System calls
- 11 - imprime caractere
- 12 - lê caractere

