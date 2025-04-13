.data
    requisita_altura: .asciiz "DIGITE A ALTURA DE UMA PESSOA (CM): " 
    exibe_maior: .asciiz "MAIOR PESSOA: "
    exibe_menor: .asciiz "MENOR PESSOA: "
    unidade: .ascii " CM"
    quebra_linha: .ascii "\n"
.text 
    # $t0 - contador
    # $t1 - maior
    # $t2 - menor
    # $t3 - leitura 

    main:
        li $t0, 1

        j loop
    loop:    
        # ENQUANTO($t0 <= 15)
        ble $t0, 15, realiza_leitura

        # SENAO
        j finaliza
    realiza_leitura:
        # PRINT(requisita_altura)
        li $v0, 4
        la $a0, requisita_altura
        syscall

        # INPUT
        li $v0, 5
        syscall

        # leitura
        add $t3, $v0, 0

        # SE($t0 == 1)
        beq $t0, 1, inicializa_extremos

        # SENAO
        j verifica_maior
    verifica_maior:
        bgt $t3, $t1, modifica_maior

        j incrementa
    verifica_menor:
        blt $t3, $t2, modifica_menor

        j incrementa
    modifica_maior:
        add $t1, $t3, 0

        j incrementa
    modifica_menor:
        add $t2, $t3, 0

        j incrementa
    inicializa_extremos:
        add $t1, $t3, 0
        add $t2, $t3, 0

        j incrementa
    incrementa:
        # contador++
        add $t0, $t0, 1

        j loop
    finaliza:
        # PRINT(menor)
        li $v0, 4
        la $a0, exibe_menor
        syscall

        li $v0, 1
        add $a0, $t2, 0
        syscall

        li $v0, 4
        la $a0, unidade
        syscall

        # PRINT(quebra_linha)
        li $v0, 4
        la $a0, quebra_linha
        syscall

        # PRINT(menor)
        li $v0, 4
        la $a0, exibe_maior
        syscall

        li $v0, 1
        add $a0, $t1, 0
        syscall

        li $v0, 4
        la $a0, unidade
        syscall