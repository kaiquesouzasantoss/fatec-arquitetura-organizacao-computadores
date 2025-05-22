.data
    requisita_raio: .asciiz "DIGITE O RAIO (CM): "
    exibe_comprimento: .asciiz "COMPRIMENTO DA CIRCUNFERENCIA: "
    unidade: .asciiz " CM"
.text
    # $t0 - comprimento
    # $t1 - pi 

    main:
        add $t0, $t0, 2
        add $t1, $t1, 3

        j raio
    raio:
        # PRINT
        li $v0, 4
        la $a0, requisita_raio
        syscall

        #INPUT
        jal entrada

        # TRATAMENTO
        jal multiplica
        jal multiplica_pi

        # FINALIZAÇÂO
        j finaliza
    multiplica:
        mul $t0, $t0, $v0

        jr $ra
    multiplica_pi:
        mul $t0, $t0, $t1

        jr $ra
    entrada:
        li $v0, 5
        syscall

        jr $ra
    finaliza:
        # PRINT(exibe_comprimento)
        li $v0, 4
        la $a0, exibe_comprimento
        syscall

        # PRINT(comprimento)
        li $v0, 1
        add $a0, $t0, 0
        syscall

        # PRINT(unidade)
        li $v0, 4
        la $a0, unidade
        syscall