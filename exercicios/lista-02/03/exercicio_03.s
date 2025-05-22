.data
    msg_ano_atual: .asciiz "DIGITE O ANO ATUAL: "
    msg_mes_atual: .asciiz "DIGITE O MES ATUAL (numericamente): "
    msg_ano_nasc: .asciiz "DIGITE O ANO DE SEU NASCIMENTO: "
    msg_mes_nasc: .asciiz "DIGITE O MES DE SEU NASCIMENTO (numericamente): "
    exibe_idade_meses: .asciiz "IDADE RESULTANTE: "
    unidade: .asciiz " MES"
.text
    # $t0 - mes_diferenca
    # $t1 - ano_atual
    # $t2 - mes_atual
    # $t3 - ano_nasc
    # $t4 - mes_nasc
    # $t5 - auxiliar

    main:
        # PRINT(msg_ano_atual)
        li $v0, 4
        la $a0, msg_ano_atual
        syscall

        # INPUT(ano_atual)
        jal entrada
        move $t1, $v0

        # PRINT(msg_mes_atual)
        li $v0, 4
        la $a0, msg_mes_atual
        syscall

        # INPUT(mes_atual)
        jal entrada
        move $t2, $v0

        # PRINT(msg_ano_nasc)
        li $v0, 4
        la $a0, msg_ano_nasc
        syscall

        # INPUT(ano_nasc)
        jal entrada
        move $t3, $v0

        # PRINT(msg_mes_nasc)
        li $v0, 4
        la $a0, msg_mes_nasc
        syscall

        # INPUT(mes_nasc)
        jal entrada
        move $t4, $v0

        j calcula_meses
    entrada:
        li $v0, 5
        syscall

        jr $ra
    calcula_meses:
        sub $t5, $t1, $t3
        mul $t0, $t5, 12

        sub $t5, $t2, $t4
        add $t0, $t0, $t5
    finaliza:
        # PRINT(exibe_idade_meses)
        li $v0, 4
        la $a0, exibe_idade_meses
        syscall

        # PRINT(mes_diferenca)
        li $v0, 1
        add $a0, $t0, 0
        syscall

        # PRINT(unidade)
        li $v0, 4
        la $a0, unidade
        syscall