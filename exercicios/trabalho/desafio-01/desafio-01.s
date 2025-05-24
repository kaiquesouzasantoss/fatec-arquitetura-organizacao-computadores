.data
    msg_entrada_n: .asciiz "[REQUEST] DIGITE UM NUMERO [3-19]: "
    msg_falha: .asciiz "[ERROR] VALOR FORA DO INTERVALO [3-19].\n"
    msg_serie: .asciiz "[INFO] PRODUTO IMPAR DOS ULTIMOS 2 TERMOS:\n"
    msg_fim: .asciiz "[INFO] FIM DA SEQUENCIA."
    quebra_linha: .asciiz "\n"
.text
    # $t0 - n
    # $t1 - contador_termos  
    # $t2 - termo_anterior 
    # $t3 - termo_atual 
    # $t4 - multiplicacao
    # $t5 - mod

    main:
        # inicializacao de valores
        li $t1, 2
        li $t2, 0
        li $t3, 1

        # print(msg_entrada_n)
        li $v0, 4
        la $a0, msg_entrada_n
        syscall

        # input(n)
        jal entrada
        move $t0, $v0

        # print(msg_serie)
        li $v0, 4
        la $a0, msg_serie
        syscall

        j fibonacci
    entrada:
        li $v0, 5
        syscall

        # entrada <= 2 or entrada >= 20 
        ble $v0, 2, falha
        bge $v0, 20, falha

        jr $ra
    falha:
        # print(msg_falha)
        li $v0, 4
        la $a0, msg_falha
        syscall

        j main
    fibonacci:
        # contador_termos >= n
        bge $t1, $t0, finaliza
        multiplicacao:
            # multiplicacao = termo_atual * termo_anterior
            mul $t4, $t3, $t2
        verifica_impar:
            # mod = multiplicacao % 2
            rem $t5, $t4, 2

            # mod == 0
            beq $t5, 0, fibonacci_proximo_termo

            # print(multiplicacao)
            li $v0, 1
            add $a0, $t4, 0
            syscall

            # print(quebra_linha)
            li $v0, 4
            la $a0, quebra_linha
            syscall
        fibonacci_proximo_termo:
            # t6 = termo_anterior + termo_atual
            add $t6, $t2, $t3    
            # termo_anterior = termo_atual
            move $t2, $t3         
            # termo_atual = novo termo
            move $t3, $t6        

            # contador_termos++
            addi $t1, $t1, 1

            j fibonacci
    finaliza:
        # print(msg_fim)
        li $v0, 4
        la $a0, msg_fim
        syscall