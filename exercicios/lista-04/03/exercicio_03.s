.data
    msg_idade: .asciiz "DIGITE SUA IDADE: "
    exibe_situacao: .asciiz "SITUAÇÃO: "
    menor_16: .asciiz "NÃO PODE DIRIGIR E NÃO PODE VOTAR!"
    menor_18: .asciiz "NÃO PODE DIRIGIR E PODE VOTAR!"
    maior_18: .asciiz "PODE DIRIGIR E PODE VOTAR!"
.text 
    # $t0 - situacao
    # $t1 - idade

    main:
        # PRINT(msg_idade)
        li $v0, 4
        la $a0, msg_idade
        syscall

        # INPUT(idade)
        jal entrada

        move $t1, $v0

        j valida_idade
    entrada:
        li $v0, 5
        syscall

        jr $ra
    valida_idade:
        blt $t1, 16, atribui_menor_16
        blt $t1, 18, atribui_menor_18

        j atribui_maior_18
    atribui_menor_16:
        la $t0, menor_16

        j finaliza
    atribui_menor_18:
        la $t0, menor_18

        j finaliza
    atribui_maior_18:
        la $t0, maior_18

        j finaliza
    finaliza:
        # PRINT(exibe_situacao)
        li $v0, 4
        la $a0, exibe_situacao
        syscall

        # PRINT(situacao)
        li $v0, 4
        la $a0, ($t0)
        syscall