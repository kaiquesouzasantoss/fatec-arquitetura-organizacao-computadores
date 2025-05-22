.data
    requisita_a: .asciiz "DIGITE O VALOR DE A: "
    requisita_b: .asciiz "DIGITE O VALOR DE B: "
    exibe_c: .asciiz "RESULTANTE (C): "
.text
    # $t0 - A
    # $t1 - B
    # $t2 - C

    main:
        # PRINT(requisita_a)
        li $v0, 4
        la $a0, requisita_a
        syscall

        # INPUT
        li $v0, 5
        syscall

        # a
        add $t0, $v0, 0

        # PRINT(requisita_b)
        li $v0, 4
        la $a0, requisita_b
        syscall

        # INPUT
        li $v0, 5
        syscall

        # b
        add $t1, $v0, 0

        # SE($t0 == $t1)
        beq $t0, $t1, soma

        # SENAO
        j multiplica
    soma:
        add $t2, $t0, $t1
        j finaliza
    multiplica:
        mul $t2, $t0, $t1
        j finaliza
    finaliza:
        li $v0, 4
        la $a0, exibe_c
        syscall

        li $v0, 1
        add $a0, $t2, 0
        syscall