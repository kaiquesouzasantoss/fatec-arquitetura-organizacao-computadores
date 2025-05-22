.data
    msg_valor_total: .asciiz "DIGITE O VALOR TOTAL DOS ITENS: R$ "
    msg_valor_parcelas: .asciiz "DIGITE O VALOR A SER PAGO MENSALMENTE: R$ "
    msg_falha_valor_total: .asciiz "[ERRO] TOTAL FORA DO INTERVALO PERMITIDO [R$1000-R$9999].\n"
    msg_falha_valor_parcela: .asciiz "[ERRO] PARCELA FORA DO INTERVALO PERMITIDO [R$100-R$500].\n"
    exibe_parcelas: .asciiz "TOTAL DE PARCELAS (MESES): "
.text
    # $t0 - parcelas
    # $t1 - valor_total
    # $t2 - valor_parcela
    # $t3 - auxiliar

    main:
    
    recebe_valor_total:
        # PRINT(msg_valor_total)
        li $v0, 4
        la $a0, msg_valor_total
        syscall

        # INPUT(valor_total)
        jal entrada
        move $t1, $v0

        blt $t1, 1000, falha_valor_total
        bge $t1, 10000, falha_valor_total
    recebe_valor_parcela:
        # PRINT(msg_valor_parcelas)
        li $v0, 4
        la $a0, msg_valor_parcelas
        syscall

        # INPUT(valor_parcelas)
        jal entrada
        move $t2, $v0

        blt $t2, 100, falha_valor_parcela
        bgt $t2, 500, falha_valor_parcela

        j calcula_parcelamento
    falha_valor_total:
        li $v0, 4
        la $a0, msg_falha_valor_total
        syscall 

        j recebe_valor_total
    falha_valor_parcela:
        li $v0, 4
        la $a0, msg_falha_valor_parcela
        syscall 

        j recebe_valor_parcela
    entrada:
        li $v0, 5
        syscall

        jr $ra
    calcula_parcelamento:
        div $t0, $t1, $t2
        rem $t3, $t1, $t2

        beq $t3, 0, finaliza

        add $t0, $t0, 1
    finaliza:
        # PRINT(exibe_parcelas)
        li $v0, 4
        la $a0, exibe_parcelas
        syscall

        # PRINT(parcelas)
        li $v0, 1
        add $a0, $t0, 0
        syscall