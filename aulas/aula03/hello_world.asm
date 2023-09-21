.data
msg: .asciiz "Hello World!\n"

.text
main:
    li $v0, 4 # carrega o número da chamada ao sistema para imprimir string
    la $a0, msg # carrega o endereço da string para imprimir
    syscall # executa a chamada ao sistema
    li $v0, 10 # carrega o número da chamada ao sistema para encerrar o programa
    syscall # executa a chamada ao sistema