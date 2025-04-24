.data
    msg_numero: .asciiz "DIGITE UM NUMERO: "
    msg_falha: .asciiz "[ERRO] VALOR NEGATIVO.\n"
    exibe_maior: .asciiz "MAIOR NUMERO: "
    exibe_menor: .asciiz " | MENOR NUMERO: "
.text
    # $t0 - maior 
    # $t1 - menor
    # $t2 - contador

    main:
        li $t2, 10

        j loop
    loop:
        # contador <= 0
        ble $t2, 0, finaliza 

        # PRINT(requisita_numero)
        li $v0, 4
        la $a0, msg_numero
        syscall

        # INPUT(entrada)
        jal entrada

        # entrada < 100
        ble $v0, 0, falha

        # contador na primeira execucao
        beq $t2, 10, inicializa_extremos

        # entrada < menor
        blt $v0, $t1, atribui_menor

        # entrada > maior
        bgt $v0, $t0, atribui_maior

        j decrementa_contador
    decrementa_contador:
        sub $t2, $t2, 1

        j loop
    falha:
        li $v0, 4
        la $a0, msg_falha
        syscall

        j loop
    entrada:
        li $v0, 5
        syscall

        jr $ra
    inicializa_extremos:
        move $t0, $v0
        move $t1, $v0

        j decrementa_contador
    atribui_maior:
        move $t0, $v0

        j decrementa_contador
    atribui_menor:
        move $t1, $v0

        j decrementa_contador
    finaliza:
        # PRINT(exibe_maior)
        li $v0, 4
        la $a0, exibe_maior
        syscall

        # PRINT(maior)
        li $v0, 1
        move $a0, $t0
        syscall

        # PRINT(exibe_menor)
        li $v0, 4
        la $a0, exibe_menor
        syscall

        # PRINT(menor)
        li $v0, 1
        move $a0, $t1
        syscall