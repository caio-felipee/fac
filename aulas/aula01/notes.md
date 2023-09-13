## Arquitetura de um computador

- Compreende o projeto estrutural de um computador, ou seja, componentes lógicos que determinam seu funcionamento.
- Um sistema computacional atualmente compreende **três camadas**:

    #### Softwares de Aplicação
    - Como por exemplo, VSCode
    - Conjunto de instruções para o computador rodar
    - Não conversam diretamente com o hardware

    #### Softwares de sistema
    - Tipos de software de sistema: 
        - Sistema Operacional
            </br>&rarr; Roda instruções em rodízio
        - Dispositivos embarcados
    - Intermediador entre o Software de Aplicação e Hardware
    - Necessita de ser direcionada à uma arquitetura específica

    #### Hardware
    - Composição física
</br></br>

<font size="3"><font size="5">&rarr;</font> **Aplicação**
    </br><font size="5">|</font> <font size="2">_Código Fonte_</font>
    </br><font size="5">|&rarr;</font> **Linguagem de alto nível**
    </br><font size="5">|</font> <font size="2">_Compilação/Interpretação_</font>
    </br><font size="5">|&rarr;</font> **Linguagem de montagem** <font size="2">(baixo nível) &rarr; assembly</font>
    </br><font size="5">|</font> <font size="2"> *Montador (assembler)*</font>
    </br><font size="5">|&rarr;</font> **Linguagem de máquina**
</font>

</br></br>
- A arquitetura de um computador, definida nas suas instruções, é chamada Arquitetura do Conjunto de Instruções (ISA), o ISA pode ser classificado como RISC ou CISC.

- RISC (Reduced Instruction Set Computer) possui poucas instruções, simples e no mesmo padrão 

- CISC (Complex Instruction Set Computer) possui centenas de instruções em seu conjunto, capazes de executar uma grande diversidade de operações

|             	| RISC                                                 	| CISC                                                                                              	|
|-------------	|------------------------------------------------------	|---------------------------------------------------------------------------------------------------	|
| Instruções 	| - menor quantidade </br>- mais simples e padronizadas     	| - maior quantidade </br>- mais complexas                                                               	|
| Projeto     	| - centrado no software                               	| - centrado no hardware                                                                            	|
| Execução   	| - executa direto no hardware com uso de controladora 	| - a instrução é produzida por um microprograma, que pode consumir vários ciclos do processador 	|

## Extra 🚩

- A linguagem de montagem pertence à arquitetura, o compilador deve variar
- Linguagem de montagem para linguagem de máquina
    - Processo 1 para 1. Só diz respeito à uma instrução.
    - Fácil reversão
- Linguagem de alto nível para linguagem de montagem
    - Processo n para n
    - *gcc -o exec codigo.c*
    </br>&rarr; flag *-o* varia a linguagem de montagem
    </br>&rarr; *-o -o1 -o2 -o3*
