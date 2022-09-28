.data
    Var1: .word 2344 # valor referencia
    Var2: .word 80 #parametro das condiçoes
    augustoejamilzincraque: .asciiz "Programa finalizado. "

.text
    lw $t0, 0($0) # valor 2344
    lw $t1,4($0) # valor 80


    while: # while
        slti $t2, $t0,  2 # Se nosso $t0 (2344) for menor do que 2, ele irá "setar" em $t2 o valor 0 e fará o loop
        bne $t2, 1, porfavorprofessor # se nosso slti (true or false) for diferente de 1 irá para o label "porfavorprofessor"
        j exit #pula para o label que diz o programa foi finalizado

    porfavorprofessor: #if
        bgt $t0, $t1, medatotal # se $t0 for maior que $t1, irá ao label medatotal, caso contrario continuará o processo
        srl $t0, $t0, 2 #shift logico de 2²
        j while #jump pra ver se a comparação if já foi concluída

        medatotal: #else
            subi $t0, $t0, 2 #subtrai 2
            j porfavorprofessor #volta pro "if" porfavorprofessor

    exit: #label que irá dizer que finalizou
    li $v0, 4
    la $a0, augustoejamilzincraque #ira exibir a mensagem declarada no .data
    syscall
