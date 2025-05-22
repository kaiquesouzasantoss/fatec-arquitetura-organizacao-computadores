.data
    msg_valor_a: .asciiz "DIGITE UM VALOR A: "
    msg_valor_b: .asciiz "DIGITE UM VALOR B: "
    exibe_a: .asciiz "A = "
    exibe_b: .asciiz " | B = "
.text
    # $t0 - A
    # $t1 - B
    # $t2 - auxiliar

    main:   
        # PRINT(msg_valor_a)
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

        j troca
    entrada:
        li $v0, 5
        syscall

        jr $ra
    troca:
        # auxiliar = A
        add $t2, $t0, 0

        # A = B
        add $t0, $t1, 0

        # B = A
        add $t1, $t2, 0 
    finaliza:
        # PRINT(exibe_a)
        li $v0, 4
        la $a0, exibe_a
        syscall

        # PRINT(A)
        li $v0, 1
        add $a0, $t0, 0
        syscall

        # PRINT(exibe_b)
        li $v0, 4
        la $a0, exibe_b
        syscall

        # PRINT(B)
        li $v0, 1
        add $a0, $t1, 0
        syscall