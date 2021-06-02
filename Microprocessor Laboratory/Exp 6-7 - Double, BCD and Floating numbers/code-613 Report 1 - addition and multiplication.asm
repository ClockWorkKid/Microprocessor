
CODE    SEGMENT
    
    ASSUME CS:CODE, DS:CODE
    
    MOV AX, A
    
    ADD AX, B
    MOV S, AX
    ADC S+2, 0  ; S+2:S = A+B
    
    MOV CX, C
    MUL CX
    MOV P, AX
    MOV P+2, DX
    MOV AX, S+2
    MUL CX
    ADD AX, P+2
    MOV P+2, AX
    ADC P+4, 0
    
    HLT 
    
    A DW 0F042H
    B DW 0ECFFH
    C DW 321BH
    S DW ?, ?
    P DW ?, ?, ?
               
CODE    ENDS  
        END