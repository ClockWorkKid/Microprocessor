ORG 100h

.DATA

    VAR1 DB 9
    
.CODE

    XOR AX, AX
    XOR DX, DX
    XOR CX, CX
    MOV BX, 1D
    
    LOOPER:
        MOV AL, BL
        MUL AL
        ADD DL, AL
        
        CMP BL, VAR1
        JE DONE
        
        ADD BL, 2
        JMP LOOPER
        
    DONE:
    
    HLT
    