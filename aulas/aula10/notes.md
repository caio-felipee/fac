## Multiplicação de inteiros

### Algoritmo

1. P = 0
2. Para cada bit b de A, em ordem de peso decrescente:
    1. Se b = 1, então P = P + B
    2. B = B << 1
3. Retorne P

Para executar este algoritmo, precisamos de um registrador para P e outro para B. O registrador de P é inicializado com 0 e o de B com o valor de A. O algoritmo é executado em um loop, que é executado uma vez para cada bit de A. A cada iteração, o bit menos significativo de B é testado. Se for 1, então P é incrementado com o valor de B. Em seguida, B é deslocado para a esquerda, para que o próximo bit menos significativo seja testado na próxima iteração.

### Quantidade de bits necessária para a operação

Vamos supor a multiplicação entre 8 (1000) e 9 (1001), que chamaremos de M e Q. A resposta do produto entre a multiplicação, chamaremos de P.

| - | 1 | 2 | 3 | 4 |
|------------|------------|------------|------------|-----|
M | 1000 | 10000 | 1000000 | 10000000
Q | 1001 | 100 | 10 | 1 | 0 |
P | 0 | 1000 | 1000 | 1000 | 1001000 |

Para executar este algoritmo, precisamos de:

| M | Q | P |
|------------|------------|------------|
| 64 bits | 32 bits | 64 bits | 

### Algoritmo otimizado

1. P[63:32] = 0 (inicialização) e P[31:0] = Q
2. Se P[Q] = 1, então P[63:32] = P[63:32] + M
3. P = P << 1
4. Se não for a 32° iteração, volte para o passo 2

Ex: Multiplicar 2x3 = 0010 x 0011

| It | Etapa | Produto |
|------------|------------|------------|
0 | Valores iniciais | P[63:32] = 0, P[31:0] = 001**1** |
1 | P[7:4] + M  <br>`srl P, P, 1`| 0010 0011 <br> 0001 000**1**|
2 | P[7:4] += M  <br>`srl P, P, 1`| 0011 0000 <br> 0001 100**0**|
3 | Mantém P <br> `srl P, P, 1` | 0001 1000 <br> 0000 110**0**|
4 | Mantém P <br> `srl P, P, 1` | 0000 1100 <br> 0000 0110|

Obs: O algoritmo apresentado funciona apenas para **inteiros sem sinal**. Para multiplicar números com sinal, basta converter os operandos para positivo, executar o algoritmo e converter o resultado para negativo, se necessário (realizando a regra de sinal).

### Instruções do Assembly MIPS

```asm
mult r1, r2 # Multiplica r1 por r2
multu r1, r2 # Multiplica r1 por r2 (sem sinal)
```

O resultado da multiplicação é armazenado em dois registradores especiais, chamados de HI e LO. O HI armazena os 32 bits mais significativos e o LO os 32 bits menos significativos.

```asm
mfhi r1 # Move o valor de HI para r1
mflo r1 # Move o valor de LO para r1
```

```asm
mthi r1 # Move o valor de r1 para HI
mtlo r1 # Move o valor de r1 para LO
```

*mf stands for move from*
*mt stands for move to*

Obs: `mul rd, rs, rt` executa rs * rt e armazena o resultado em rd. O resultado é truncado para 32 bits. Funciona bem se *rs* e *rt* tiverem, no máximo, 16 bits.