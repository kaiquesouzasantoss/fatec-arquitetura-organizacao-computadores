.data
    msg_requisita_nota: .asciiz "DIGITE UMA NOTA [0-10]: "
    msg_exibe_media: .asciiz "NOTA MEDIA: "
    msg_exibe_estado: .asciiz " | ESTADO: "
    aprovado: .asciiz "APROVADO"
    exame: .asciiz "EXAME"
    retido: .asciiz "RETIDO"
.text
    # $t0 - media
    # $t1 - contador

    main:
        add $t1, $t1, 1
        la $t2, retido

        j loop
    loop:
        # verifica loop
        bgt $t1, 4, calcula_media

        # PRINT(requisita_nota)
        li $v0, 4
        la $a0, msg_requisita_nota
        syscall

        # INPUT
        jal entrada

        # media += entrada
        add $t0, $t0, $v0

        # contador++
        addi $t1, $t1, 1

        j loop
    entrada:
        li $v0, 5
        syscall

        jr $ra
    calcula_media:
        div $t0, $t0, 4

        j finaliza
    finaliza:
        jal exibe_media
        j exibe_estado
    exibe_media:
        # PRINT(exibe_media)
        li $v0, 4
        la $a0, msg_exibe_media
        syscall

        # PRINT(media)
        li $v0, 1
        add $a0, $t0, 0
        syscall

        jr $ra
    exibe_estado:
        # PRINT(exibe_estado)
        li $v0, 4
        la $a0, msg_exibe_estado
        syscall

        bge $t0, 6, estado_aprovado
        bge $t0, 3, estado_exame

        j exibe_situacao
    estado_exame:
        la $t2, exame

        j exibe_situacao
    estado_aprovado:
        la $t2, aprovado

        j exibe_situacao
    exibe_situacao:
        # PRINT(estado)
        li $v0, 4
        la $a0, ($t2)
        syscall