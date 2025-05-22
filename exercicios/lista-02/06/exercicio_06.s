.data
    msg_valor_a: .asciiz "DIGITE UM VALOR A: "
    msg_valor_b: .asciiz "DIGITE UM VALOR B: "
    exibe_iguais: .asciiz "VALORES IGUAIS Á: "
    exibe_maior: .asciiz "MAIOR: "
    exibe_menor: .asciiz "| MENOR: "
.text
    # $t0 - A
    # $t1 - B
    # $t2 - maior
    # $t3 - menor

    main:
        # PRINT(msg_valor_b)
        li $v0, 4
        la $a0, msg_valor_a
        syscall

        # A = entrada
        jal entrada
        add $t0, $v0, 0

        # PRINT(msg_valor_b)
        li $v0, 4
        la $a0, msg_valor_b
        syscall

        # B = entrada
        jal entrada
        add $t1, $v0, 0

        # A == B
        beq $t0, $t1, iguais
        j ordena_valores
    entrada:
        li $v0, 5
        syscall

        jr $ra
    iguais:
        # PRINT(exibe_iguais)
        li $v0, 4
        la $a0, exibe_iguais
        syscall

        li $v0, 1
        add $a0, $t0, 0
        syscall

        # finaliza 
        li $v0, 10
        syscall
    ordena_valores:
        bgt $t0, $t1, a_maior

        j b_maior
    a_maior:
        add $t2, $t0, 0
        add $t3, $t1, 0

        j diferentes
    b_maior:
        add $t2, $t1, 0
        add $t3, $t0, 0

        j diferentes
    diferentes:
        # PRINT(exibe_maior)
        li $v0, 4
        la $a0, exibe_maior
        syscall

        li $v0, 1
        add $a0, $t2, 0
        syscall
        
        # PRINT(exibe_menor)
        li $v0, 4
        la $a0, exibe_menor
        syscall

        li $v0, 1
        add $a0, $t3, 0
        syscall