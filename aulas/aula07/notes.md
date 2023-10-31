## Instruções de desvio

`beq r1, r2, label` # se r1 == r2, vá para a label
`bne r1, r2, label` # se r1 != r2, vá para a label

### Endereçamento relativo ao PC: 

- Endereçamento de destino do desvio = *4 * label + PC*
    - Quantidade de instruções a partir da atual

#### Exemplo

```c
if(i == j)
    f = g + h;
else
    f = g - h;
```

- *f -> $s0*
- *g -> $s1*
- *h -> $s2*
- *i -> $s3*
- *j -> $s4*

```asm
.text
main:
    beq $s3, $s4, if
    sub $s0, $s1, $s2 # f = g - h

    j fim
    if:
        add $s0, $s1, $s2 # f = g + h
    fim:
```

## Laços

```c
int i = 0;

while(i < n) {
    A[i] = 0;
    i++;
}
```

```asm
.text
main:
    add $t0, $zero, $zero # i = 0

loop:
    slt $t2, $t0, $s0 # i < n?
    beq $t2, $zero, exit
    sll $t1, $t0, 2 # t1 = i * 4
    add $t1, $s1, $t1 # t1 = end. A[i]
    sw $zero, 0($t1)
    addi $t0, $t0, 1 # i += 1
j loop

exit:
```

## Procedimentos

```c
int media(int a, int b) {
    return (a + b) / 2;
}

int main() {
    media(a, b);

    return 0;
}
```

- Fluxo de chamada a procedimentos:
1. Coloque os argumentos nos registradores
2. Desvie a execução p/ o procedimento
3. Ajusto armazento no procedimento
4. Execute o procedimento
5. Armazene o resultado nos registradores
6. Ajuste o armazenamento
7. Retorne ao procedimento chamador


### Registradores:

- `$a0 a $a3`: passagem de argumentos
- `$v0 a $v1`: retorno de procedimentos

#### Ajuste de armazenamento

- `$s0 a $s7`: devem ser **preservados**
