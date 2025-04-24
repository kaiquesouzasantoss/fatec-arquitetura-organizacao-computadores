.data
    requisita_valor: .asciiz "DIGITE UM NUMERO: "
    exibe_resultado: .asciiz "RESULTANTE: "
.text
    # $t0 - valor
    # $t1 - resultante
    # $t2 - auxiliar

    main:
        # PRINT(requisita_valor)
        li $v0, 4
        la $a0, requisita_valor
        syscall

        # INPUT
        li $v0, 5
        syscall

        # valor
        add $t0, $v0, 0

        j verifica_par
    verifica_par:
        rem $t2, $t0, 2

        # SE($t2 % 2 == 0)
        beq $t2, 0, par

        # SENAO
        j impar
    par:
        add $t1, $t0, 5 

        j finaliza
    impar:
        add $t1, $t0, 8

        j finaliza
    finaliza:
        # PRINT(resultante)
        li $v0, 4
        la $a0, exibe_resultado
        syscall

        li $v0, 1
        add $a0, $t1, 0
        syscall