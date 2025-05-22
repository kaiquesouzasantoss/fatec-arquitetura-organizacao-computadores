.data
    requisita_maior: .asciiz "DIGITE O TAMANHO DO LADO MAIOR(CM): "
    requisita_menor: .asciiz "DIGITE O TAMANHO DO LADO MENOR(CM): "
    requisita_altura: .asciiz "DIGITE O TAMANHO DA ALTURA(CM): "
    exibe_area: .asciiz "AREA DO TRAPEZIO: "
    unidade: .ascii " CM"
.text
    # $t0 - maior
    # $t1 - menor
    # $t2 - altura
    # $t3 - area

    main:
        # PRINT(requisita_maior)
        li $v0, 4
        la $a0, requisita_maior
        syscall

        # INPUT
        li $v0, 5
        syscall

        # maior
        add $t0, $v0, 0

        # PRINT(requisita_menor)
        li $v0, 4
        la $a0, requisita_menor
        syscall

        # INPUT
        li $v0, 5
        syscall

        # menor
        add $t1, $v0, 0

        # PRINT(requisita_altura)
        li $v0, 4
        la $a0, requisita_altura
        syscall

        # INPUT
        li $v0, 5
        syscall

        # altura
        add $t2, $v0, 0

        # area
        add $t3, $t0, $t1
        mul $t3, $t3, $t2
        div $t3, $t3, 2

        # PRINT(area)
        li $v0, 4
        la $a0, exibe_area
        syscall

        li $v0, 1
        add $a0, $t3, 0
        syscall

        li $v0, 4
        la $a0, unidade
        syscall