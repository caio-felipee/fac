## Representação de números reais

A representação de reais parte da notação científica de um número. Um número está em notação científica se estiver na forma:

`± F x B^e`, sendo B^e uma potência<br>

Onde:
- F é a **fração** (significando ou mantissa)
- B é a **base numérica** da representação (radix)
- e é o **expoente** (exponent)

### Exemplo

- `3.155.760 = 3,155760 x 10^6`

Em binário, a representação é a mesma e os números à direita da vírgula são potências negativas de 2.

- `5,5 = 101,1`<br>
= 2^2 + 2^1 + 2^0 + 2^-1

### Um número em notação científica pode ser:
- **Normalizado**: quando a fração é maior ou igual a 1 e menor que a base

- `2,34 x 10^2`

**0 ≤ F < B**

- **Não-normalizado**: quando a fração é menor que 1

Em binário, um número normalizado tem a forma:

`± 1,xxxxxxx x 2^e`, sendo `x` a mantissa e `e` o expoente

O padrão de representação de números reais adotado mais amplamente é o padrão IEEE 754, que admite dois formatos: precisão **simples** e **dupla**.

### Precisão simples

| Sinal | Expoente | Mantissa |
| ----- | -------- | -------- |
| 1 bit | 8 bits   | 23 bits  |

**Total:** 32 bits <br>
**Expoente:** é um número com sinal no padrão **excesso** (não é complemento de dois!) <br>
**Fração (ou mantissa):** é o que vem à direita do ponto binário (já que à esquerda é sempre 1) <br>
A representação dos bits são dadas, em ordem, da esquerda para a direita.

#### Representação do expoente

- x = `101,1 x 2^-6` => `1,011 x 2^-4` <br>

| Sinal | Expoente | Mantissa |
| ----- | -------- | -------- |
| 0     | 1111 1100| 01100000000000000000000 |

- y =  `1,1 x 2^3` => `2^-1 x 2^4` <br>

| Sinal | Expoente | Mantissa |
| ----- | -------- | -------- |
| 0     | 0000 0011 | 10000000000000000000000 |

- x > y
- A discrepância é indesejável

#### Sinal por excesso

- Por que o professor realizou a explicação através de desenho no quadro, deixarei este espaço em branco para mostrar que o conteúdo foi ministrado e que deve ser estudado. Em breve, terá uma explicação aqui.

#### Capacidade de representação

- Os expoentes 0 e 255 são reservados
- menor = 0 | 0000 | 0001 | 00000000000000000000000 = 2^-126

- maior = 0 | 1111 | 1110 | 11111111111111111111111 = 2^127

### Precisão dupla

| Sinal | Expoente | Mantissa |
| ----- | -------- | -------- |
| 1 bit | 11 bits  | 20 + 32 = 52 bits  |

- **Total:** 64 bits <br>
- **Bias**: 1023 <br>
- **Capacidade**: <br>
    - menor: 2^-1023 <br>
    - maior: 2^1024

### Números especiais

| Expoente | Fração | Descrição |
| -------- | ------ | --------- |
| 0 | 0 | zero |
| 0 | ≠ 0 | ± número desnormalizado |
| 1...254 | qualquer | ± número normalizado |
| 1...2046 | qualquer | ± número normalizado |
| 255/2047 | 0 | ± infinito |
| 255/2047 | ≠ 0 | Not a Number (NaN)|

- `NaN:` resultado de operações inválidas, como 0/0 ou ∞ - ∞
