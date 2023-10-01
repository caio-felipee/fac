## Instruções de acesso à memória

- A memória é um "vetor" com células de 1 byte
- `lw reg1, const (reg2)` - minemónio de leitura
    - load word
    - lê o conteúdo da memória do endereço *reg2 + const*

- `sw reg1, const (reg2)` - minemónio de escrita
    - store word
    - salva o conteúdo de reg1 na memória, no endereço *reg2 + const*

*Obs*: Os dados sempre são salvos em endereços múltiplos de 4. Isso se chama **restrição de alinhamento**. 

*Obs*: Para utilizar as intruções de acesso à memória, o espaço na memória deve estar alocado. Há duas formas de alocar espaço na memória:

1. **Declarações em** `.data`
2. `syscall 9`

### Representações

- **1 byte:** = 8 bits
- **1 kb** = 2**10 bytes / 1024 bytes
- **1 mb** = 2**10 kb / 1024 kb / 2\*\*20 bytes
- **1 gb** = 2**10 mb / 1024 mb / 2\*\*30 bytes

### Exemplo

```c
g = h + a[8]
/*
* g em $s0
* h em $s1
* endereço base de a em $s2
*/
```

```asm
# const: deslocamento
# reg: end. base
lw $t0 32($s2)
add $s0 $s1 $t0
sw $s0 48($s2)
```


## Sistema numérico

1. Posicional
    - Ex: 100
        O mesmo símbolo possui valores distintos a depender da posição que ocupa.

2. Possui base