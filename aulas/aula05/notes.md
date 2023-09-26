## Representação numérica

- Possui base
- É posicional

- Processador MIPS 32 possui registradores de 32 bits (4 bytes). Qual a capacidade de representação?

### Números sem sinal

- Menor: 0
- Maior: 2^32 - 1

### Números com sinal

- Menor: -2^31
- Maior: 2^31 - 1

- Obs: O MIPS 32 não implementa o long mas a ideia seria usar 2 registradores, o que nos dá:
    - *unsigned long*: 0 a 2^64 - 1
    - *signed long*: -2^63 a 2^63 - 1

- Obs 2: No Assembly MIPS, as instruções interpretam o binário como um inteiro com sinal. Algumas possuem variantes terminadas por "u", que interpretam o binário como um inteiro sem sinal. (e.g addu) 

### Representação das intruções em linguagem de máquina

- As instruções em assembly MIPS são traduzidas para binário e seguem 3 formatos padrão: `tipo R, tipo I, tipo J`

### Formato tipo R (3 registradores)

op | rs | rt | rd | shamt | funct
---|----|----|----|-------|------
6 bits | 5 bits | 5 bits | 5 bits | 5 bits | 6 bits

- op: código da operação `valores tabelados`
- rs: registrador source - registradores operandos `valores tabelados`
- rt: registrador target - registrador de destino (em ordem)
- rd: registrador destino 
- shamt: shift amount (quantidade de bits a serem deslocados)
- funct: código da função

#### Exemplo
`add $t0, $s1, $s2`

tipo r | $s1 | $s2 | $t0 | 0 | add
-------|-----|-----|-----|---|-----
000000 (0) | 10001 (17) | 10010 (18) | 01000 (8) | 00000 (0) | 100000 ( 32)

= binário de 32 bits

### Formato tipo I (2 registradores e um imediato [const])

op | rs | rt | const/endereço
---|----|----|--------------
6 bits | 5 bits | 5 bits | 16 bits

- op: código da operação `valores tabelados`
- rs: registrador source - registradores operandos `valores tabelados`
- rt: registrador target - registrador de destino (em ordem)
- const/endereço: constante ou endereço de memória

#### Exemplo

`addi $t0, $s0, 21`

tipo I | $t0 | $s0 | 21
-------|-----|-----|---
001000 (8) | 01000 (8) | 10000 (16) | 0000000000010101 (21)

= binário de 32 bits

- Obs: No tipo I, uma constante varia de -2^15 a 2^15 - 1
    - Para representar um número negativo, é necessário usar o complemento de 2
    - Para operações imediatas, se precisar de uma constante maior, deve-se salvar na memória (*.data) e carregar num registrador usando `lw`
    - Para `sw` e `lw` explica porque a lógica é end. base + offset

### Instruções lógicas e de deslocamento

1. Deslocamentos - Tipo R
    - `sll`: shift left logical 
        - `sll $t0, $s0, 2` 
        - = `$t0 = $s0 << 2`
    - `srl`: shift right logical 
        - `srl $t0, $s0, 2`
        - = `$t0 = $s0 >> 2`

2. Lógicas
    - `and`: e lógico
        - `and $t0, $s0, $s1` = `$t0 = $s0 & $s1`
    - `or`: ou lógico
        - `or $t0, $s0, $s1` = `$t0 = $s0 | $s1`
    - `nor`: ou lógico negado
        - `nor $t0, $s0, $s1` = `$t0 = ~($s0 | $s1)`
    - `xor`: ou exclusivo
        - `xor $t0, $s0, $s1` = `$t0 = $s0 ^ $s1`

## Extra
- ULA = Unidade Lógica e Aritmética