## Adição em ponto flutuante

### Exemplo

- 9.999 x 10^1 + 1.610 x 10^-1

**1. Alinhar o ponto**

- Dar shifts à direita no número com menor expoente (para cada shift, soma 1 ao expoente)

    - 9.999 x 10^1 + 0.0161 x 10^1

**2. Somar os significandos** <br>
- 10.105 x 10^1

**3. Normalizar o resultado** <br>
- 1.0105 x 10^2

## Multiplicação em ponto flutuante

### Exemplo

- 1.0 x 2^-1 x -1.11 x 2^-2

**1. Soma-se os expoentes**
- Sem o bias -> **-1 - 2 = -3**
- Com o bias -> **(-1 + 127) + (-2 + 127) = -3 + 254 - 127 = -3 + 127**

**2. Multiplica os significandos**
- **10 x 1.11 = 1.11 x 2^⁻3**

**3. Normaliza o resultado e ajusta o sinal**

## Instruções em assembly MIPS

- A arquitetura MIPS traz um hardware próprio para manipular número de ponto flutuante.

### Este hardware inclui
- Instruçõse próprias
- 32 registradores $f0, $f1, $f2, ..., $f31
    - Podem ser usadas individualmente para precisão simples
    - São usados aos pares para precisão dupla ($f0/$f1, $f2/$f3)

As instruções terminam sempre por:
- `.s`, para precisão simples
- `.d` para precisão dupla

### Os principais são

1. Aritméticas
    - `add .s / add .d`
    - `sub .s / sub .d`
    - `mul .s / mul .d`
    - `div .s / div .d`

- `add .d $f0, $f8, $f10`

2. Acesso à memória
    - `l.s / l.d:` load (carrega)
    - `s.s / s.d:` store (armazena)

Exemplo:
```asm
    l.d $f0, 0($s0)
    l.s $f0, label (pseudo)
```

3. Desvios condicionais: faz-se em duas etapas <br>
    - comparação dos valores de registradores, com resultado salvo num registrador especial
    - desvio feito com base no valor do registrador especial.
    Desvio feito com base no valor do registrador especial.

### Comparação

- `c.eq.s/c.eq.d` =
- `c.ne.s/c.ne.d` !=
- `c.lt.s/c.lt.d` <
- `c.le.s/c.le.d` <=
- `c.gt.s/c.gt.d` >
- `c.ge.s/c.ge.d` >=

### Exemplo

```c
float f2e(float fahr) {
    return (5.0/9.0) * (fahr - 32.0);
}
```

```asm
.data
    c5: .float 5.0
    c9: .float 9.0
    c32: .float 32.0

.text
f2c:
    l.s $f1, c5
    l.s $f2, c9
    l.s $f3, c32

    div.s $f10, $f1, $f2 # $f10 = 5.0/9.0
    sub.s $f0, $f0, $f3 # $f0 = fahr - 32.0
    mul.s $f0, $f10, $f0 
```