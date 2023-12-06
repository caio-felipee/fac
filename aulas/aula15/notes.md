## Controle da ULA
- A ULA é utilizada para:
    - Load/Store: F = add
    - Desvio (beq): F = subtract
    - Instruções tipo R: F depende do campo funct

| ALU control | Function |
|-------------|----------|
| 0000 | AND |
| 0001 | OR |
| 0010 | ADD |
| 0110 | SUBTRACT |
| 0111 | set-on-less-than |
| 1100 | NOR |

- Importante para prova:
    - Instruções do tipo R (segundo slide passado em aula)
        - Controladora

### Problemas de desempenho
- A insrtução mais demorada determina o período de clock
    - Caminho crítico: instrução load
    - Memória de instrução -> banco de registradores -> ULA -> memória de dados -> banco de registradores

- Entretanto, outras instruções são mais rápidas
- Isso será melhorado com pipeline