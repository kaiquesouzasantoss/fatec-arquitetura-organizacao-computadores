.data
    requesita_grande : .asciiz "DIGITE A QUANTIDADE DE CAMISETAS NO TAMANHO (GRANDE): "
    requesita_medio  : .asciiz "DIGITE A QUANTIDADE DE CAMISETAS NO TAMANHO (MEDIO): "
    requesita_pequeno: .asciiz "DIGITE A QUANTIDADE DE CAMISETAS NO TAMANHO (PEQUENO): "
    exibe_moeda      : .ascii "MONTANTE: R$ "
.text
    # $t0 - grande
    # $t1 - medio
    # $t2 - pequeno
    # #t3 - auxiliar
    # $t4 - montante

    main: 
    	    # PRINT(requesita_grande)
    		li $v0, 4
    		la $a0, requesita_grande
    		syscall
    		
    		# INPUT
    		li $v0, 5
    		syscall
    		
    		# grande
    		add $t0, $v0, 0

            # PRINT(requesita_medio)
    		li $v0, 4
    		la $a0, requesita_medio
    		syscall
    		
    		# INPUT
    		li $v0, 5
    		syscall
    		
    		# medio
    		add $t1, $v0, 0

            # PRINT(requesita_pequeno)
    		li $v0, 4
    		la $a0, requesita_pequeno
    		syscall
    		
    		# INPUT
    		li $v0, 5
    		syscall
    		
    		# pequeno
    		add $t2, $v0, 0

            # montante - grande
            mul $t3, $t0, 15
            add $t4, $t4, $t3  

            # montante - medio
            mul $t3, $t1, 12
            add $t4, $t4, $t3  

            # montante - pequeno
            mul $t3, $t2, 10
            add $t4, $t4, $t3  

            # PRINT(montante)
            li $v0, 4
            la $a0, exibe_moeda
            syscall

            li $v0, 1
            add $a0, $t4, 0
            syscall