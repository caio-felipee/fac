## Linguagem de montagem (Assembly)

- Arquitetura MIPS 32 bits
</br>&rarr;  Utilizaremos o simulador SPIM
</br>&rarr; `spim -f codigo.spim`

- Um processador MIPS de 32 bits possui 32 registradores em sua unidade principal, que opera com inteiros.
    - Possui 18 registradores para uso geral
    - Possui 14 registradores reservados


### Operações aritméticas
- Todas as operações aritméticas seguem este formato:
    - `add a, b, c`
    </br>&rarr; a = b + c

- Quem são as variáveis? **Registradores!**
    </br>&rarr; Pequenas unidades de memória de acesso imediato dentro do processador
    </br>&rarr; Memória que armazena *32* bits (4 bytes)
    </br>&rarr; Estão no topo da hierarquia de memória. Sendo assim, é o tipo de memória mais rápida e mais cara.