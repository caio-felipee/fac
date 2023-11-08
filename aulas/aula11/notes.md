# Aviso

Essas notas são baseadas em parte da aula ministrada pelo professor. É complicado demonstrar o algoritmo da divisão de inteiros sem o auxílio de um quadro branco. Portanto, é recomandado que utilize essas notas apenas como um auxílio para o estudo, não limitando a este, uma vez que considero estas anotações confusas para o entendimento inicial.

## Divisão de inteiros

- Necessário registradores para guardar o quociente e o resto da divisão
- O quociente é o resultado da divisão
- O resto é o resto da divisão

### Algoritmo

| Dividendo | Divisor | Resto | Quociente |
| --------- | ------- | ----- | --------- |
| 32 bits   | 64 bits | 64 bits | 32 bits |

*Passo 1:* Resto = Dividendo. Salve o divisor na parte mais signitificativa do registrador.

*Passo 2:* Resto = Resto - divisor

*Passo 3:* Desloque o quociente 1 bit a esquerda. <br>
*3.1.* Se resto < 0, restaure o resto e defina Q[0] = 0. <br>
*3.2.* Se resto >= 0, defina Q[0] = 1.

*Passo 4:* Desloque o divisor 1 bit a direita. Se a iteração não for a 32° vá para o passo 2.

### Exemplo
#### 7 / 3 = 0111 / 0011

| Iteração | Etapa | Quociente | Divisor | Resto |
| -------- | ----- | --------- | ------- | ----- |
| 0 | Valores Iniciais | 0000 | 0010 0000 | 0000 0111 |
| 1 | Resto -= Divisor | 0000 | 0010 0000 | < 0 |
|   | Desloca Q | 0000 | 0010 0000 | 0000 0111 |
|   | Desloca D | 0000 | 0001 0000 | 0000 0111 |

| Iteração | Etapa | Quociente | Divisor | Resto |
| -------- | ----- | --------- | ------- | ----- |
| 2 | Resto -= Divisor | 0000 | 0001 0000 | < 0 |
|   | Desloca Q | 0000 | 0001 0000 | 0000 0111 |
|   | Desloca D | 0000 | 0000 1000 | 0000 0111 |

| Iteração | Etapa | Quociente | Divisor | Resto |
| -------- | ----- | --------- | ------- | ----- |
| 3 | Resto -= Divisor | 0000 | 0000 1000 | < 0 |
|   | Desloca Q | 0000 | 0000 0100 | 0000 0111 |
|   | Desloca D | 0000 | 0000 0100 | 0000 0111 |

| Iteração | Etapa | Quociente | Divisor | Resto |
| -------- | ----- | --------- | ------- | ----- |
| 4 | Resto -= Divisor | 0000 | 0000 0100 | 0000 0011 |
|   | Desloca Q | 0001 | 0000 0100 | 0000 0011 |
|   | Desloca D | 0000 | 0000 0010 | 0000 0011 |

| Iteração | Etapa | Quociente | Divisor | Resto |
| -------- | ----- | --------- | ------- | ----- |
| 5 | Resto -= Divisor | 0001 | 0000 0010 | 0000 0001 |
|   | Desloca Q | 0001 | 0000 0010 | 0000 0001 |
|   | Desloca D | 0011 | 0000 0001 | 0000 0001 |

### Algoritmo otimizado

*Passo 1:* Resto = Dividendo, i = 1 <br>
*Passo 2:* Desloque o resto 1 bit à esquerda. <br>
*Passo 3:* Resto[63..32] -= divisor. <br>
*Passo 4:* Se i <= 32, i++ e volte ao passo 3. <br>
*Passo 5:* Desloque Resto[63..32] 1 bit à direita. <br>

Este algoritmo funciona apenas para números positivos.

Portanto, para calcular a divisão entre os números negativos.
1. Transforme os operandos em positivo e execute o algoritmo
2. Negue o quociente se os sinais dos operandos eram diferentes
3. Faça com que o resto tenha o mesmo sinal de dividendo.

### Instruções

```asm
div $s0, $s1 # $s0 = $s0 / $s1
divu $s0, $s1 # $s0 = $s0 / $s1 (sem sinal)
```

```asm
mfhi $s0 # $s0 = resto
mflo $s0 # $s0 = quociente
```