.data
    entrada: .asciiz "DIGITE UM NUMERO BINARIO: "
    saida:  .asciiz "DECIMAL: "
    erro: .asciiz "NUMERO FORA DO INTERVALO! TENTE NOVAMENTE.\n"
.text
    # $t0 - binário
    # $t1 - acumulador decimal
    # $t2 - potência de 2 (inicialmente 2^0 = 1)
    # $t3 - último dígito binário extraído (0 ou 1)
    # $t4 - resultado da multiplicação

    main:
        li $t1, 0          
        li $t2, 1    

        # ESCREVA(entrada)
        li $v0, 4
        la $a0, entrada
        syscall

        # LEIA(entrada)
        li $v0, 5
        syscall

        # SE(entrada < 1 || entrada > 1000000000) ENTÂO FALHA
        ble $v0, 1, falha
        bge $v0, 1000000000, falha

        # SENÃO binário = entrada
        move $t0, $v0    

        j loop
    falha:
        # ESCREVA(erro)
        li $v0, 4
        la $a0, erro
        syscall 

        j main
    loop:
        # SE(binário == 0) ENTÃO FIM
        beqz $t0, fim

        divu $t0, $t0, 10      # binário = binário / 10
        mfhi $t3               # resto = último dígito (0 ou 1)
        
        li $t7, 0          
        li $t8, 1 
        beq $t3, $t7, segue
        beq $t3, $t8, segue
        
        bgt $t3, $t7, falha
        bgt $t3, $t8, falha
        segue:
            mflo $t0               # quociente = próximo número
            mul $t4, $t3, $t2      # resultado da multiplicação = bit * potência de 2
            add $t1, $t1, $t4      # acumulador decimal += resultado da multiplicação

            sll $t2, $t2, 1        # potência = potência * 2
            j loop
    fim:
        # ESCREVA(saida)
        li $v0, 4
        la $a0, saida
        syscall

        # ESCREVA(acumulador decimal)
        li $v0, 1
        move $a0, $t1
        syscall
