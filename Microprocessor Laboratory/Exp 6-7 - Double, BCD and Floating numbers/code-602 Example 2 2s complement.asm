CODE    SEGMENT
    
    ASSUME CS:CODE
    
    MOV CX, 5
    MOV DI, 0
    
    NEGATE:
    
    MOV AX, [A+DI]
    NEG AX
    MOV [B+DI], AX
    ADD DI, 2
    LOOP NEGATE
    
    HLT
    
    
    A DW 1H, 0FFFFH, 0F056H, 1056H, 4059H
    B DW ?, ?, ?, ?, ?         
    
                    
CODE    ENDS  
        END