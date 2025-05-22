.data
    msg_a: .asciiz "DIGITE O VALOR DO COEFICIENTE A: "
    msg_b: .asciiz "DIGITE O VALOR DO COEFICIENTE B: "
    msg_c: .asciiz "DIGITE O VALOR DO COEFICIENTE C: "
    exibe_duas_raizes: .asciiz "RESULTANTE: DUAS RAÍZES REAIS"
    exibe_uma_raiz: .asciiz "RESULTANTE: UMA RAÍZ REAL"
    exibe_sem_raiz: .asciiz "RESULTANTE: NÃO EXISTEM RAÍZES REAIS!"
.text
    # $t0 - delta
    # $t1 - a
    # $t2 - b
    # $t3 - c

    main:
        # PRINT(msg_a)
        li $v0, 4
        la $a0, msg_a
        syscall

        # INPUT(a)
        jal entrada
        move $t1, $v0

        # PRINT(msg_b)
        li $v0, 4
        la $a0, msg_b
        syscall

        # INPUT(b)
        jal entrada
        move $t2, $v0

        # PRINT(msg_c)
        li $v0, 4
        la $a0, msg_c
        syscall

        # INPUT(c)
        jal entrada
        move $t3, $v0

        # delta
        jal calcula_delta

        # 
        bgt $t0, 0, atribui_duas_raizes
        beq $t0, 0, atribui_uma_raiz

        j atribui_sem_raiz
    entrada:
        li $v0, 5
        syscall

        jr $ra
    calcula_delta:
        # delta = a * c
        mul $t0, $t1, $t3

        # delta = delta * 4
        mul $t0, $t0, 4
    
        # b = b * b
        mul $t2, $t2, $t2

        # delta = b - delta
        sub $t0, $t2, $t0

        jr $ra
    atribui_duas_raizes:
        la $a0, exibe_duas_raizes

        j finaliza
    atribui_uma_raiz:
        la $a0, exibe_uma_raiz

        j finaliza
    atribui_sem_raiz:
        la $a0, exibe_sem_raiz

        j finaliza
    finaliza:
        li $v0, 4
        syscall
