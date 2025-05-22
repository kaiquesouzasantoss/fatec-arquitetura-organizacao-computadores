.data
    msg_entrada: .asciiz "DIGITE UM NUMERO ENTRE [100-999]: "
    msg_falha: .asciiz "[ERRO] NUMERO NAO ESTA DENTRO DO INTERVALO [100-999].\n"
    centena: .asciiz "CENTENA: "
    dezena: .asciiz " | DEZENA: "
    unidade: .asciiz " | UNIDADE: "
.text
    # t0 - valor
    # t1 - centena
    # t2 - dezena
    # t3 - unidade 
    # $t4 - auxiliar

    main:
        # PRINT(msg_entrada)
        li $v0, 4
        la $a0, msg_entrada
        syscall

        # valor = entrada
        jal entrada
        add $t0, $v0, 0

        # valor < 100
        blt $t0, 100, msg_falha

        # valor > 999
        bgt $t0, 999, msg_falha

        j segmenta_unidade
    entrada:
        li $v0, 5
        syscall

        jr $ra
    falha:
        li $v0, 4
        la $a0, exibe_falha
        syscall 

        j main
    segmenta_unidade:
        # centena
        div $t1, $t0, 100 
        mul $t4, $t1, 100
        sub $t0, $t0, $t4

        # dezena
        div $t2, $t0, 10
        mul $t4, $t2, 10
        sub $t0, $t0, $t4

        # unidade
        move $t3, $t0
    finaliza:
        # PRINT(centena)
        li $v0, 4
        la $a0, centena
        syscall

        li $v0, 1
        add $a0, $t1, 0
        syscall 

        # PRINT(dezena)
        li $v0, 4
        la $a0, dezena
        syscall

        li $v0, 1
        add $a0, $t2, 0
        syscall 

        # PRINT(unidade)
        li $v0, 4
        la $a0, unidade
        syscall

        li $v0, 1
        add $a0, $t3, 0
        syscall 