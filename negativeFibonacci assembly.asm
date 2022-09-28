#Estamos utilizando a configuração de memória como endereço de referência 0 para data    lw $t2, 12($t0)
add $t3, $t1, $t2
sw $t3 16($t0)
addi $t0,$t0,4
addi $s2, $s2, 1
slti $t7, $s2,32
bne $t7, $0, loop

lw $t1, 8($t0)#ITERAÇÃO "EXTRA" EQUIVALENTE AO F(32)
lw $t2, 12($t0)#
add $t3, $t1, $t2#

addi $t0, $0, 0
lw $s2, 0($0)

#TENTATIVA DE PRINT DE VALORES POR ITERAÇÃO

#print:lw $a0, 8($t0)
#addi $v0, $0, 1
#syscall
#lw $a0, 4($t0)
#addi $v0, $0, 4
#syscall
#addi $t0,$t0,4
#slt $t7, $s2,$s1
#bne $t7, $0, print 

add $a0, $0, $t3#PRINT "EXTRA" EQUIVALENTE AO F(32)
addi $v0, $0, 1#
syscall#


addi $v0, $0, 10
syscall 
