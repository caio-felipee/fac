# Instruções condicionais

`slt $t0, $t1, $t2` - Se $t1 < $t2, $t0 = 1, senão $t0 = 0 <br>
`slti $t0, $t1, 10` - Se $t1 < 10, $t0 = 1, senão $t0 = 0

- slt = set less than
- Obs: slt é uma instrução de comparação, não de desvio condicional
- Obs2: sltu é a versão sem sinal de slt, porém pode retornar valores diferentes de slt

## Instruções de desvio condicional

`beq $t0, $t1, label` - Se $t0 == $t1, pula para label <br>
`bne $t0, $t1, label` - Se $t0 != $t1, pula para label <br>

- beq = branch if equal
- bne = branch if not equal

### Como fazer para desviar para label se r1 >= r2

```asm
slt $t0, $t1, $t2 # Se $t1 < $t2, $t0 = 1, senão $t0 = 0
beq $t0, $zero, label # Se $t0 == 0, pula para label
```

### Como fazer para desviar para label se r1 > r2

```asm
slt $t0, $t2, $t1 # Se $t2 < $t1, $t0 = 1, senão $t0 = 0
bne $t0, $zero, label # Se $t0 != 0, pula para label
```

- Obs: Também existe a instrução `bge` (branch if greater or equal)

## Instruções de desvio incondicional

`j label` - Pula para label <br>

- j = jump
- Obs: Deslocamento relativo ao PC
    - label se transforma na quantidade de instruções a partir da instrução sendo executada
    - Ex: `j label` pula para a instrução 4, se a instrução sendo executada for a 1
- Obs2: O endereço de label deve ser múltiplo de 4
- O endereço de destino do desvio = PC + (label * 4)