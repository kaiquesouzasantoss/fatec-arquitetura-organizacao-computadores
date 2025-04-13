.data
    requisita_horas: .asciiz "DIGITE A QUANTIDADE DE HORAS TRABALHADAS: "
    requisita_desconto: .asciiz "DIGITE O DESCONTO APLICADO(R$ FIXO): R$ "
    exibe_salario_bruto: .asciiz "SALARIO BRUTO: R$ "
    exibe_salario_liquido: .asciiz "SALARIO LIQUIDO: R$ "
    quebra_linha: .ascii "\n"
.text
    # $t0 - horas trabalhadas
    # $t1 - horas extras
    # $t2 - desconto
    # $t3 - salario bruto
    # $t4 - salario liquido
    # $t5 - auxiliar

    main:
        # PRINT(requisita_horas)
        li $v0, 4
        la $a0, requisita_horas
        syscall
        
        # INPUT
        li $v0, 5
        syscall
        
        # horas
        add $t0, $v0, 0
        
        # PRINT(requisita_desconto)
        li $v0, 4
        la $a0, requisita_desconto
        syscall
        
        # INPUT
        li $v0, 5
        syscall
        
        # desconto
        add $t2, $v0, 0
        
        # salario bruto
	    ble $t0, 44, horas_comum
	
	    j horas_extras
	
    horas_comum:
    	mul $t3, $t0, 10
    
    	j desconto
    	
    horas_extras:
    	sub $t1, $t0, 44
    	sub $t0, $t0, $t1
    	
    	mul $t3, $t0, 10
    	mul $t5, $t1, 15
    	add $t3, $t3, $t5
    	
    	j desconto
    
    desconto:
    	add $t4, $t3, 0
    	sub $t4, $t4, $t2
    	
    	j resultado
    	
    resultado:
    	# PRINT(salario_bruto)
        li $v0, 4
        la $a0, exibe_salario_bruto
        syscall
        
        li $v0, 1
        add $a0, $t3, 0
        syscall
        
        # QUEBRA LINHA
        li $v0, 4
        la $a0, quebra_linha
        syscall
        
        # PRINT(salario_liquido)
        li $v0, 4
        la $a0, exibe_salario_liquido
        syscall
        
        li $v0, 1
        add $a0, $t4, 0
        syscall