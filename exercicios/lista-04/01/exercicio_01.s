.data
    msg_area_m2: .asciiz "DIGITE A AREA DE UM QUADRADO (M^2): "
    exibe_area_cm2: .asciiz "AREA DO QUADRADO: "
    unidade: .asciiz " cm^2"
.text
    # $t0 - area_cm2
    # $t1 - area_m2

    main:
        # PRINT(msg_area_m2)
        li $v0, 4
        la $a0, msg_area_m2
        syscall

        # INPUT(area_m2)
        jal entrada
        add $t1, $v0, 0 

        j converte
    entrada:
        li $v0, 5
        syscall

        jr $ra
    converte:
        mul $t0, $t1, 10000
    finaliza:
        # PRINT(exibe_area_cm2)
        li $v0, 4
        la $a0, exibe_area_cm2
        syscall

        # PRINT(area_cm2)
        li $v0, 1
        add $a0, $t0, 0
        syscall

        # PRINT(unidade)
        li $v0, 4
        la $a0, unidade
        syscall