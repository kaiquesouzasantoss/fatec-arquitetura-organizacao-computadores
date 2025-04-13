.data
    requisita_numero: .asciiz "DIGITE UM NUMERO: "
    exibe_falha: .asciiz "[ERRO] VALOR FORA DO INTERVALO [0-100]."
    exibe_intervalo_01: .asciiz "NUMEROS DENTRO DO INTERVALO [0-25]: "
    exibe_intervalo_02: .asciiz "NUMEROS DENTRO DO INTERVALO [26-50]: "
    exibe_intervalo_03: .asciiz "NUMEROS DENTRO DO INTERVALO [51-75]: "
    exibe_intervalo_04: .asciiz "NUMEROS DENTRO DO INTERVALO [76-100]: "
    quebra_linha: .ascii "\n"
.text
    # $t1 - entrada
    # $t2 - intervalo [0-25]
    # $t3 - intervalo [26-50]
    # $t4 - intervalo [51-75]
    # $t5 - intervalo [76-100]

    main:
        j loop
    loop:
        # PRINT(requisita_numero)
        li $v0, 4
        la $a0, requisita_numero
        syscall

        # INPUT(entrada)
        li $v0, 5
        syscall
        add $t1, $v0, 0

        # SE(entrada < 0)
        bltz $t1, finaliza

        # SE(entrada > 100)
        bgt $t1, 100, falha

        # SE(entrada <= 25)
        ble $t1, 25, incrementa_intervalo_01

        # SE(entrada <= 50)
        ble $t1, 50, incrementa_intervalo_02

        # SE(entrada <= 75)
        ble $t1, 75, incrementa_intervalo_03

        # SE(entrada <= 100)
        ble $t1, 100, incrementa_intervalo_04
    incrementa_intervalo_01:
        add $t2, $t2, 1

        j loop
    incrementa_intervalo_02:
        add $t3, $t3, 1

        j loop
    incrementa_intervalo_03:
        add $t4, $t4, 1

        j loop
    incrementa_intervalo_04:
        add $t5, $t5, 1

        j loop
    falha:
        li $v0, 4
        la $a0, falha
        syscall

        j loop
    finaliza:
        # PRINT(intervalo_01)
        li $v0, 4
        la $a0, exibe_intervalo_01
        syscall

        li $v0, 1
        add $a0, $t2, 0
        syscall

        # PRINT(quebra_linha)
        li $v0, 4
        la $a0, quebra_linha
        syscall

        # PRINT(intervalo_02)
        li $v0, 4
        la $a0, exibe_intervalo_02
        syscall

        li $v0, 1
        add $a0, $t3, 0
        syscall

        # PRINT(quebra_linha)
        li $v0, 4
        la $a0, quebra_linha
        syscall

        # PRINT(intervalo_03)
        li $v0, 4
        la $a0, exibe_intervalo_03
        syscall

        li $v0, 1
        add $a0, $t4, 0
        syscall

        # PRINT(quebra_linha)
        li $v0, 4
        la $a0, quebra_linha
        syscall

        # PRINT(intervalo_04)
        li $v0, 4
        la $a0, exibe_intervalo_04
        syscall

        li $v0, 1
        add $a0, $t5, 0
        syscall