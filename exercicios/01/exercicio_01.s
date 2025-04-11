.data
    requesita_lado_maior: .asciiz "DIGITE O LADO MAIOR(M): "
    requisita_lado_menor: .asciiz "DIGITE O LADO MENOR(M): "
    exibe_area          : .asciiz "AREA DO RETANGULO: "
    exibe_metro         : .ascii " M"
.text
    # $t0 - lado maior
    # $t1 - lado menor
    # $t2 - area

    main: 
        # PRINT(requesita_lado_maior)
        li $v0, 4
        la $a0, requesita_lado_maior
        syscall
        
        # INPUT
        li $v0, 5
        syscall
        
        # maior
        add $t0, $v0, 0
        
        # PRINT(requesita_lado_menor)
        li $v0, 4
        la $a0, requisita_lado_menor
        syscall
        
        # INPUT
        li $v0, 5
        syscall
        
        # menor
        add $t1, $v0, 0
        
        # area
        mul $t2, $t0, $t1
        div $t2, $t2, 2
        
        # PRINT(area)
        li $v0, 4
        la $a0, exibe_area
        syscall
        
        li $v0, 1
        add $a0, $t2, 0
        syscall
        
        li $v0, 4
        la $a0, exibe_metro
        syscall