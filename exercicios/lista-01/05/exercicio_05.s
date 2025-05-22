.data
    requisita_cateto_01: .asciiz "DIGITE O TAMANHO DO 1 CATETO (CM): "
    requisita_cateto_02: .asciiz "DIGITE O TAMANHO DO 2 CATETO (CM): "
    exibe_hipotenusa: .asciiz "HIPOTENUSA: "
    unidade: .ascii " CM"
.text
    # $t0 - cateto_01
    # $t1 - cateto_02
    # $t2 - hipotenusa
    # $f0 - cateto_01 (float)
    # $f1 - cateto_02 (float)
    # $f2 - hipotenusa (float)
    # $f3 - auxiliar (float)

    main:
        # PRINT(requisita_cateto_01)
        li $v0, 4
        la $a0, requisita_cateto_01
        syscall

        # INPUT
        li $v0, 5
        syscall
        # cateto_01
        add $t0, $v0, 0

        # PRINT(requisita_cateto_02)
        li $v0, 4
        la $a0, requisita_cateto_02
        syscall

        # INPUT
        li $v0, 5
        syscall

        # cateto_02
        add $t1, $v0, 0

        # cateto float
        mtc1 $t0, $f0
        cvt.s.w $f0, $f0
        mtc1 $t1, $f1
        cvt.s.w $f1, $f1

        # hipotenusa
        mul.s $f0, $f0, $f0  
        mul.s $f1, $f1, $f1  
        add.s $f3, $f0, $f1  
        sqrt.s $f2, $f3   

        # PRINT(hipotenusa)
        li $v0, 4
        la $a0, exibe_hipotenusa
        syscall

        li $v0, 2
        mov.s $f12, $f2
        syscall

        li $v0, 4
        la $a0, unidade
        syscall