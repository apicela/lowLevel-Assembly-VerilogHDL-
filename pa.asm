.data


.globl array
array: .word 1,2,3,4
.globl sum
sum:
.word 0
.globl quantidade
quantidade:
.word 4

.globl formula
formula:
.word 0
#concluido: .asciiz "Os valores obtidos pela formula de PA de Gauss e o valor obtido através do somatorio, sao iguais"
#falhou: .asciiz "Os valores obtidos pela formula de PA de Gauss e o valor obtido através do somatorio sao diferentes"


.text

add $t0, $0,$0   # t0 = iterator do loop
lw $t4, sum($0) #t4 = valor sum total
lw $t5, 20($0) # t5 = numero elementos

main:
slt $t1, $t0, $t5 # compara se i < n e salva em $t1
beq $t1, 1, loop # se i<n vá para loop
sw $t4, 16($0) #salva o valor do somatorio bruto no endereço do sum
j formulaPA

loop:
sll $t3, $t0, 2 # salvar em t3 o endereço do indice
lw $t2, array($t3) #carrega array [0] em $t2
add $t4, $t4, $t2 # adiciona o valor do array no sum
addi $t0, $t0, 1 # i = i+1
j main

formulaPA: # formula:   S = n*(a1+an)/2
lw $t7, 0($0) #carrega a[0] em $t7
lw $t6, 12($0) #carrega a[3] em $t6
add $t7, $t7, $t6 # salva a1 + an em $t7
lw $t6, quantidade($0) #carrega em $t6 o valor N
mul $t7, $t6, $t7 # fazendo n*(a1+an)
srl $t7, $t7, 1 # divide por 2 e salva em $t7
lw $t4, 16($0) # carrega em $t4 a soma do vetor utilizando força bruta
beq $t7, $t4, sucess
li $v0, 4
#la $a0, falhou
syscall
j exit

sucess:
li $v0, 4
#la $a0, concluido
syscall
j exit

exit:


