.data
    msg_recebe_n: .asciiz "DIGITE UM NUMERO NATURAL: "
    msg_falha: .asciiz "[ERRO] VALOR FORA DO INTERVALO PERMITIDO [1-50]!\n"
    exibe_soma: .asciiz "SOMATORIA: "
.text 
    # $t0 - soma 
    # $t1 - n
    # $t2 - contador

    main:   
        # contador = 1
        li $t2, 1

        # PRINT(msg_recebe_n)
        li $v0, 4
        la $a0, msg_recebe_n
        syscall

        # INPUT(n)
        jal entrada
        add $t1, $v0, 0

        j calcula_soma
    entrada: 
        li $v0, 5
        syscall

        # entrada <= 0
        ble $v0, 0, falha

        # entrada > 50
        bgt $v0, 50, falha

        jr $ra
    falha:
        li $v0, 4
        la $a0, msg_falha
        syscall

        j main
    calcula_soma:
        # contador >= n
        bge $t2, $t1, finaliza

        add $t0, $t0, $t2

        add $t2, $t2, 1

        j calcula_soma
    finaliza:
        # PRINT(exibe_soma)
        li $v0, 4
        la $a0, exibe_soma
        syscall

        # PRINT(soma)
        li $v0, 1
        add $a0, $t0, 0
        syscall