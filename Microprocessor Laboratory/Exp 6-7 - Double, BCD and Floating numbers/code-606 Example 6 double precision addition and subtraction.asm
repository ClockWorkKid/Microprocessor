; DOUBLE PRECISION ADDITION AND SUBTRACITON
; C+4:C+2:C = A+2:A + B+2:B
; D+2:D = A+2:A - B+2:B

CODE    SEGMENT
    
    ASSUME CS:CODE
    
    MOV AX, A
    MOV BX, B
    ADD AX, BX
    MOV C, AX
    MOV AX, A+2
    MOV BX, B+2
    ADC AX, BX
    MOV C+2, AX
    ADC C+4, 0
    
    MOV AX, A
    MOV BX, B
    SUB AX, BX
    MOV D, AX
    MOV AX, A+2
    MOV BX, B+2
    SBB AX, BX
    MOV D+2, AX
    
    
    HLT
    
    A DW 0F056H, 4509H
    B DW 1056H, 1509H
    C DW ?, ?, ?
    D DW ?, ?  
    
                    
CODE    ENDS  
        END