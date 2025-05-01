.data
    msg_p1: .asciiz "DIGITE A NOTA DA P1 [0-100]: "
    msg_p2: .asciiz "DIGITE A NOTA DA P2 [0-100]: "
    msg_p3: .asciiz "DIGITE A NOTA DA P3 [0-100]: "
    msg_falha: .asciiz "[ERRO] VALOR FORA DO INTERVALO [0-100].\n"
    situacao: .asciiz "SITUAÇÃO: "
    aprovado: .asciiz "APROVADO"
    reprovado: .asciiz "REPROVADO"
.text
    # $t0 - media
    # $t1 - P1
    # $t2 - P2
    # $t3 - P3
    # $t4 - situacao

    main:
        # PRINT(msg_p1)
        li $v0, 4
        la $a0, msg_p1
        syscall

        # INPUT(P1)
        jal entrada
        add $t1, $v0, 0  
    recebe_p2:
        # PRINT(msg_p2)
        li $v0, 4
        la $a0, msg_p2
        syscall

        # INPUT(P2)
        jal entrada
        add $t2, $v0, 0 
    recebe_p3: 
        # PRINT(msg_p3)
        li $v0, 4
        la $a0, msg_p3
        syscall

        # INPUT(P3)
        jal entrada
        add $t3, $v0, 0 

        j calcula_media
    entrada:
        li $v0, 5
        syscall

        # entrada < 0
        blt $v0, 0, falha

        # entrada > 100
        bgt $v0, 100, falha

        jr $ra
    falha:
        li $v0, 4
        la $a0, msg_falha
        syscall

        j main
    calcula_media:
        # P1
        mul $t1, $t1, 30
        div $t1, $t1, 100
        add $t0, $t0, $t1

        # P2
        mul $t2, $t2, 50
        div $t2, $t2, 100
        add $t0, $t0, $t2

        # P3
        mul $t3, $t3, 20
        div $t3, $t3, 100
        add $t0, $t0, $t3
    finaliza:
        # PRINT(situacao)
        li $v0, 4
        la $a0, situacao
        syscall
    validacao_situacao:
        bge $t0, 60, situacao_aprovado

        la $t4, reprovado

        j exibe_situacao
    situacao_aprovado:
        la $t4, aprovado
    exibe_situacao:
        # PRINT(situacao)
        li $v0, 4
        la $a0, ($t4)
        syscall