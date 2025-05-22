.data
    requisita_valor_1: .asciiz "DIGITE O 1 NUMERO: "
    requisita_valor_2: .asciiz "DIGITE O 2 NUMERO: "
    exibe_erro: .asciiz "[ERRO] TENTE DIGITAR UM VALOR DIFERENTE DE 0 (ZERO).\n"
    exibe_resultado: .asciiz "RESULTANTE: "
.text
    # $t0 - valor_01
    # $t1 - valor_02
    # $t2 - resultante

    main:
        j recebe_valor_01
    recebe_valor_01:
        # PRINT(requisita_valor_1)
        li $v0, 4
        la $a0, requisita_valor_1
        syscall

        # INPUT
        li $v0, 5
        syscall

        # valor_01
        add $t0, $v0, 0

        j recebe_valor_02
    recebe_valor_02:
        # PRINT(requisita_valor_2)
        li $v0, 4
        la $a0, requisita_valor_2
        syscall

        # INPUT
        li $v0, 5
        syscall

        # valor_01
        add $t1, $v0, 0

        # SE($t1 == 0)
        beq $t1, 0, apresenta_erro

        # SENAO
        j finaliza
    apresenta_erro:
        # PRINT(exibe_erro)
        li $v0, 4
        la $a0, exibe_erro
        syscall

        j recebe_valor_02
    finaliza:
        # resultante

        div $t2, $t0, $t1
        
        # PRINT(resultante)
        li $v0, 4
        la $a0, exibe_resultado
        syscall

        li $v0, 1
        add $a0, $t2, 0
        syscall