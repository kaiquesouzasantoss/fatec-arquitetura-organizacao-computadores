.data
    msg_salario: .asciiz "DIGITE O SALARIO ATUAL DO FUNCIONARIO: R$ "
    msg_falha: .asciiz "[ERRO] VALOR NEGATIVO.\n"
    exibe_novo_salario: .asciiz "SALARIO AJUSTADO: R$ "
    ajuste: .word 25
.text 
    # $t0 - salario_ajustado
    # $t1 - ajuste
    # $t2 - salario_recebido

    main:
        # ajuste
        la $t1, ajuste
        lw $t1, 0($t1)

        # PRINT(msg_salario)
        li $v0, 4
        la $a0, msg_salario
        syscall

        jal entrada

        # salario_recebido < 0
        blt $t2, 0, falha

        j atualiza_salario
    entrada:
        li $v0, 5
        syscall

        # salario_recebido = entrada
        move $t2, $v0

        jr $ra
    falha:
        # PRINT(msg_falha)
        li $v0, 4
        la $a0, msg_falha
        syscall

        j main
    atualiza_salario:
        # ajuste = ajuste + 100
        add $t1, $t1, 100

        # salario_ajustado = salario_recebido * ajuste
        mul $t0, $t2, $t1

        # salario_ajustado = salario_ajustado / 100
        div $t0, $t0, 100 
    finaliza:
        # PRINT(exibe_novo_salario)
        li $v0, 4
        la $a0, exibe_novo_salario
        syscall

        # PRINT(salario_ajustado)
        li $v0, 1
        add $a0, $t0, 0
        syscall