.data
    requisita_comprimento: .asciiz "DIGITE O COMPRIMENTO (CM): "
    requisita_largura: .asciiz "DIGITE A LARGURA (CM): "
    requisita_altura: .asciiz "DIGITE A ALTURA (CM): "
    exibe_area: .asciiz "VOLUME DO PARALELEPIPEDO: "
    unidade: .asciiz " CM"
.text
    # $t0 - volume

    main:
        add $t0, $t0, 1

        j comprimento
    comprimento:
        # PRINT
        li $v0, 4
        la $a0, requisita_comprimento
        syscall

        #INPUT
        jal entrada
        jal multiplica

        j largura
    largura:
        # PRINT
        li $v0, 4
        la $a0, requisita_largura
        syscall

        #INPUT
        jal entrada
        jal multiplica

        j altura
    altura:
        # PRINT
        li $v0, 4
        la $a0, requisita_altura
        syscall

        #INPUT
        jal entrada
        jal multiplica

        j finaliza
    multiplica:
        mul $t0, $t0, $v0

        jr $ra
    entrada:
        li $v0, 5
        syscall

        jr $ra
    finaliza:
        # PRINT(exibe_area)
        li $v0, 4
        la $a0, exibe_area
        syscall

        # PRINT(area)
        li $v0, 1
        add $a0, $t0, 0
        syscall

        # PRINT(unidade)
        li $v0, 4
        la $a0, unidade
        syscall