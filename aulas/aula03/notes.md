## Escrevendo um programa em assembly MIPS

- Um programa em assembly MIPS possui o seguinte esqueleto:
    - data (seção de dados)
    - text (seção de código)
    </br>&rarr; main (rotina principal - rótulo)
    </br>&rarr; rótulo: "apelido" para um endereço de memória

- A execução do código começa na linha rotulada por `main` e segue linha após linha (salvo se houver um desvio). A esse **paradigma** chamamos **sequencial**.

### Tipos de dados

- `.word w1, w2, ..., wm` -> dado de 32 bits
- `.half h1, h2, ..., hn` -> dado de 16 bits
- `.byte b1, b2, ..., bn` -> dado de 8 bits
- `.asciiz "string"` -> sequência de caracteres ASCII terminada por 0

### Exemplo

```assembly
    .data
    msg: .asciiz "Hello World!\n"
    x: .word 0x12345678
```

- `msg`: rótulo para o endereço de memória onde está armazenada a string *"Hello World!\n"* 

### Chamadas ao sistema (System Call)

- Escrita na tela, leitura de dados, alocação de memória, encerrar o programa, etc.
- Para executar uma chamada ao sistema, precisamos fazer o seguinte:
1. Carregar o número da chamada ao sistema no registrador `$v0`
2. Carregar os argumentos da chamada ao sistema nos registradores `$a0`, `$a1`, `$a2`, `$a3` (opcional, depende da operação)
3. Executar a instrução `syscall`
4. Colher o retorno (opcional) nos regs `$v0` e `$v1`.

### Extra
- Para representar o zero, há um registrador especial chamado `$zero`, que sempre contém o valor 0.
- **Instruções imediatas:** variações de algumas instruções, terminando o mnemônico com i, que trabalha com dois registradores e uma constante (nessa ordem).

```assembly
    addi $t0, $t0, 1 # Comentário: $t0 = $t0 + 1
```

### Pseudoinstruções
- São instruções simplifica que não pertencem à ISA e que são traduzidas pelo montador para instruções. 3 pseudoinstruções úteis:

1. `li $t0, 10` -> carrega o valor 10 no registrador `$t0`
</br>&rarr; `li reg const`
</br>&rarr; li = load immediate

2. `move $t0, $t1` -> move o conteúdo do registrador `$t1` para o registrador `$t0`
</br>&rarr; `move reg1 reg2`

3. `la $t0, msg` -> carrega o endereço da string `msg` no registrador `$t0`
</br>&rarr; `la reg label`
</br>&rarr; la = load address

### Imprimindo "Hello World"
```assembly
.data
msg: .asciiz "Hello World!\n"

.text
main:
    li $v0, 4 # carrega o número da chamada ao sistema para imprimir string
    la $a0, msg # carrega o endereço da string para imprimir
    syscall # executa a chamada ao sistema
    li $v0, 10 # carrega o número da chamada ao sistema para encerrar o programa
    syscall # executa a chamada ao sistema
```

- `syscall 4`: imprime string na tela
- `syscall 10`: encerra o programa/processo
- Para acessar o código, clique [aqui](./hello_world.asm).