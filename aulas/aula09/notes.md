# Aritmética Computacional

- Adição e subtração
    - Overflow
- Multiplicação e divisão
- Representação de ponto flutuante 

### Inteiros

- Com sinal: [-2^31, 2^31 - 1]
- Sem sinal: [0, 2^32 - 1]
- Ultrapassando estes limites, resulta em overflow.

### Reais

- Quando não conseguimos representar um número muito pequeno, temos *underflow*

### Adição

- Semelhante à soma binária normal

## Overflow

O overflow pode acontecer:
- Na soma, quando o sinal dos operandos forem iguais
- Na subtração, quando os sinais dos operandos forem diferentes

## Não há overflow
- Soma, com sinais diferentes
- Subtração, com sinais iguais

### Na linguagem de montagem

- Usaremos o `addu` para não lançar exceção ao dar overflow (a função `add` lança exceção).

```asm
.text
main:
    addu $t0, $t1, $t2
    xor $t3, $t1, $t2 # verificação de sinal
    slt $t3, $t3, $zero
    bne $t3, $zero, sem-overflow # se o sinal dos operandos forem iguais e o do resultado diferente, houve overflow!
    xor $t3, $t0, $t1
    slt $t3, $t3, $zero
    bne $t3, $zero, overflow
```

### Números sem sinal

`$t1 + $t2 > 2^32 - 1` <br>
`$t1 > 2^32 - 1 - $t2`

A negação de `$t2`: <br>
`~x = 2^n - x`

```asm
.text
main:
    addu $t0, $t1, $t2
    nor $t3, $t2, $zero # t3 = 2^32 - $t2 - 1
    slt $t3, %t3, $t1 # 2^32 - t2 - 1 < t1?
    bne $t3, $zero, overflow
```