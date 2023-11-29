## Implementação de um processador MIPS

- Versão simplificada (monociclo)
- Versão com pipeline

### Execução de uma instrução

Ciclo fetch - decode - execute.
- **Fetch**: busca a instrução na memória
- **Decode**: decodifica a instrução e obtém os dados necessários para a instrução
    - Acesso aos registradores
- **Execute**: executa a instrução
- Dependendo da classe da instrução:
    - Usa uma ULA para cálculos
        - Instruções aritméticas: resultado da operação
        - Instruções de acesso à memória: cálculo do endereço
        - Instruções de desvio: endereço do desvio
    - Usa a memória para acessar dados
        - Instruções de acesso à memória: leitura ou escrita

### Princípios do design lógico

- Informação sempre codificada em binário <br>
    - Voltagem baixa = 0
    - Voltagem alta = 1

### Metodologia de clock
- A lógica combinacional transforma os dados durante um ciclo de clock
    - Entre os limites do clock
    - Entrada de um elemento de estado, saída para um elemento de estado
    - A instrução mais demorada determina a duração do clock

### Construindo um caminho de dados
- Caminho de dados: conjunto de elementos de estado e lógica combinacional que transforma os dados

### Instruções load/store
- Lê os registradores operandos
- Calcula o endereço de memória usando o offset de 16 bits
    - Usa a ULA e também um extensor de sinal do offset
- Load: lê da memória e escreve no registrador
- Store: lê do registrador e escreve na memória

### Instruções de desvio
- Lê os registradores operandos
- Calcula o endereço de desvio
    - Usa a ULA e também um extensor de sinal do offset
    - 2 shifts left para multiplicar por 4
- Escreve o endereço de desvio no PC
- Compara os operandos
    - Usa a ULA
    - Usa um registrador especial para guardar o resultado da comparação
    - Verifica se a saída é zero