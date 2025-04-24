.data 
    msg_valor_a: .asciiz "DIGITE O PRIMEIRO VALOR: "
    msg_valor_b: .asciiz "DIGITE O SEGUNDO VALOR: "
    msg_somatoria: .asciiz "SOMATORIA DE IMPARES: "
.text 
    # $t0 - somatoria
    # $t1 - maior 
    # $t2 - menor
    # $t3 - resto

    main:
        # PRINT(msg_valor_a)
        li $v0, 4
        la $a0, msg_valor_a
        syscall

        # INPUT(valor_a)
        jal entrada

        # maior = entrada, menor = entrada
        move $t1, $v0
        move $t2, $v0

        # PRINT(msg_valor_b)
        li $v0, 4
        la $a0, msg_valor_b
        syscall

        # INPUT(valor_b)
        jal entrada

        # entrada > maior
        bgt $v0, $t1, atribui_maior
        blt $v0, $t2, atribui_menor

        j calcula_somatoria
    entrada:
        li $v0, 5
        syscall

        jr $ra
    atribui_maior:
        move $t1, $v0

        j calcula_somatoria
    atribui_menor:
        move $t2, $v0

        j calcula_somatoria
    calcula_somatoria:
        blt $t1, $t2, finaliza

        # resto = maior atual / 2
        rem $t3, $t1, 2

        # resto == 0 
        bne $t3, 0, soma_se_impar

        j decrementa_maior
    soma_se_impar:
        add $t0, $t0, $t1

        j decrementa_maior
    decrementa_maior:
        # maior--
        sub $t1, $t1, 1

        j calcula_somatoria
    finaliza:
        li $v0, 4
        la $a0, msg_somatoria
        syscall

        li $v0, 1
        move $a0, $t0
        syscall