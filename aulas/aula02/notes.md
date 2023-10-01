## Linguagem de montagem (Assembly)

- Arquitetura MIPS 32 bits
</br>&rarr;  Utilizaremos o simulador SPIM
</br>&rarr; `spim -f codigo.spim`

- Um processador MIPS de 32 bits possui 32 registradores em sua unidade principal, que opera com inteiros.
    - Possui 18 registradores para uso geral
    - Possui 14 registradores reservados

    | Notação    | ID      |                     |
    | ---------- | ------- | ------------------- |
    | $t0 a $t7  | 8-15    | 8 regs. temporários |
    | $s0 a $s7  | 16-23   | 8 regs. salvos      |
    | $t8 e $t9 | 24 e 25 | 2 regs. temporários |
    | Restante   |  `---`  | Uso reservado       |

### Operações aritméticas
- Todas as operações aritméticas seguem este formato:
    - `add a, b, c`
        </br>**&rarr; a = b + c**
    - `sub a, b, c`
        </br>**&rarr; a = b - c**
    - `mul a, b, c`
        </br>**&rarr; a = b * c**
    - `div, a, b, c`
        </br>**&rarr; a = b / c**

- Quem são as variáveis? **Registradores!**
    </br>&rarr; Pequenas unidades de memória de acesso imediato dentro do processador
    </br>&rarr; Memória que armazena *32* bits (4 bytes)
    </br>&rarr; Estão no topo da hierarquia de memória. Sendo assim, é o tipo de memória mais rápida e mais cara.

### Exemplo

- Código alto nível
```c
/*
 * f = $s0
 * g = $s1
 * h = $s2
 * i = $s3
 * s = $s4
*/

int f = (g + h) - (i + j);
```

- Código baixo nível assembly
```asm
    add $t0, $s1, $s2 # t0 = g + h
    add $t1, $s3, $s4 # t1 = i + j
    sub $s0, $t0, $t1 # f = t0 - t1
```