.data
    requisita_a: .asciiz "DIGITE O VALOR DE A: "
    requisita_b: .asciiz "DIGITE O VALOR DE B: "
    exibe_resto: .asciiz "RESTO RESULTANTE: "
.text
    # $t0 - A
    # $t1 - B
    # $t2 - maior
    # $t3 - menor
    # $t4 - divisao
    # $t5 - resto

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

        # SE($t0 >= $t1)
        bge $t0, $t1, maior_a

        # SENAO
        j maior_b
    maior_a:
        add $t2, $t0, 0
        add $t3, $t1, 0

        j divide
    maior_b:
        add $t2, $t1, 0
        add $t3, $t0, 0

        j divide
    divide:
        div $t4, $t2, $t3
        mul $t4, $t4, $t3
        sub $t5, $t2, $t4

        j finaliza
    finaliza:
        li $v0, 4
        la $a0, exibe_resto
        syscall

        li $v0, 1
        add $a0, $t5, 0
        syscall