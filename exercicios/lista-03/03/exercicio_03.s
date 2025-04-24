.data
    requisita_valor_a: .asciiz "DIGITE UM VALOR: "
    requisita_valor_b: .asciiz "DIGITE UM SEGUNDO VALOR: "
    exibe_diferenca: .asciiz "DIFERENCA: "
.text
    # $t0 - diferenca
    # $t1 - auxiliar

    main:
        j valor_a
    valor_a:
        # PRINT
        li $v0, 4
        la $a0, requisita_valor_a
        syscall

        # INPUT
        jal entrada

        # auxiliar
        add $t1, $v0, 0

        j valor_b
    valor_b:
        # PRINT
        li $v0, 4
        la $a0, requisita_valor_b
        syscall

        # INPUT
        jal entrada

        # diferenca = auxiliar - entrada
        sub $t1, $t1, $v0

        j trata
    trata:
        abs $t0, $t1

        j finaliza
    entrada:
        li $v0, 5
        syscall

        jr $ra
    finaliza:
        # PRINT(exibe_diferenca)
        li $v0, 4
        la $a0, exibe_diferenca
        syscall

        # PRINT(comprimento)
        li $v0, 1
        add $a0, $t0, 0
        syscall