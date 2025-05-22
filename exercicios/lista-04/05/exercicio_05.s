.data
    msg_recebe_n: .asciiz "DIGITE UM NUMERO NATURAL: "
    msg_falha: .asciiz "[ERRO] VALOR FORA DO INTERVALO PERMITIDO [1-50]!\n"
    exibe_positivo: .asciiz "QUANTIDADE DE POSITIVOS: "
    exibe_negativo: .asciiz "\nQUANTIDADE DE NEGATIVOS: "
.text 
    # $t0 - n
    # $t1 - contador
    # $t2 - positivo
    # $t3 - negativo
    # $t4 - valor

    main:   
        # contador = 1
        li $t1, 1

        # PRINT(msg_recebe_n)
        li $v0, 4
        la $a0, msg_recebe_n
        syscall

        # INPUT(n)
        jal entrada

        # entrada <= 0
        ble $v0, 0, falha

        # entrada > 10
        bgt $v0, 10, falha

        add $t0, $v0, 0

        j recebe_valores
    entrada: 
        li $v0, 5
        syscall

        jr $ra
    falha:
        li $v0, 4
        la $a0, msg_falha
        syscall

        j main
    recebe_valores:
        # contador >= n
        bgt $t1, $t0, finaliza

        # PRINT(msg_recebe_n)
        li $v0, 4
        la $a0, msg_recebe_n
        syscall

        # INPUT(n)
        jal entrada
        add $t4, $v0, 0

        # valor < 0
        blt $t4, 0, se_negativo

        # positivo++
        add $t2, $t2, 1

        j incrementa_contador
    se_negativo:
        # negativo++
        add $t3, $t3, 1
        
        j incrementa_contador
    incrementa_contador:
        add $t1, $t1, 1

        j recebe_valores
    finaliza:
        # PRINT(exibe_positivo)
        li $v0, 4
        la $a0, exibe_positivo
        syscall

        # PRINT(positivo)
        li $v0, 1
        add $a0, $t2, 0
        syscall

        # PRINT(exibe_negativo)
        li $v0, 4
        la $a0, exibe_negativo
        syscall

        # PRINT(negativo)
        li $v0, 1
        add $a0, $t3, 0
        syscall