.data
    requisita_valor: .asciiz "DIGITE UM NUMERO: "
    exibe_resultado: .asciiz "RESULTANTE: "
.text
    # $t0 - valor
    # $t1 - resultante

    main:
        # PRINT(requisita_valor)
        li $v0, 4
        la $a0, requisita_valor
        syscall

        # INPUT
        li $v0, 5
        syscall

        # valor
        add $t0, $v0, 0

        j verifica_positivo
    verifica_positivo:
        # SE($t0 >= 0)
        bgtz $t2, positivo

        # SENAO
        j negativo
    positivo:
        mul $t1, $t0, 2

        j finaliza
    negativo:
        mul $t1, $t0, 3

        j finaliza
    finaliza:
        # PRINT(resultante)
        li $v0, 4
        la $a0, exibe_resultado
        syscall

        li $v0, 1
        add $a0, $t1, 0
        syscall