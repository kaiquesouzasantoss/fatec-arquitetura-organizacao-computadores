.data
    dolar: .word 5
    msg_real: .asciiz "DIGITE UM VALOR: R$ "
    msg_falha: .asciiz "[ERRO] DIGITE UM VALOR MAIOR QUE ZERO.\n"
    msg_dolar: .asciiz "COTAÇÃO EM DOLAR (U$): " 
    decimais: .asciiz ",00"
.text
    # $t0 - dolar
    # $t1 - base do dolar
    # $t2 - real

    main:
        # dolar
        la $t1, dolar
        lw $t1, 0($t1)

        # PRINT(msg_real)
        li $v0, 4
        la $a0, msg_real
        syscall

        jal entrada

        ble $t2, 0, falha

        j cota_dolar
    entrada:
        li $v0, 5
        syscall

        # real = entrada
        move $t2, $v0

        jr $ra
    falha:
        # PRINT(msg_falha)
        li $v0, 4
        la $a0, msg_falha
        syscall

        j main
    cota_dolar:
        mul $t0, $t1, $t2
    finaliza:
        # PRINT(msg_dolar)
        li $v0, 4
        la $a0, msg_dolar
        syscall

        # PRINT(dolar)
        li $v0, 1
        add $a0, $t0, 0
        syscall

        # PRINT(decimais)
        li $v0, 4
        la $a0, decimais
        syscall