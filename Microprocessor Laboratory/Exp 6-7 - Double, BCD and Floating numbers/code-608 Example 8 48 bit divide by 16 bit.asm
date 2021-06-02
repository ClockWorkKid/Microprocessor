; DIVIDING 48 BIT NUMBER BY 16 BIT NUMBER
; Q+2:Q = A+4:A+2:A / BX, R = REMAINDER

CODE    SEGMENT
    
    ASSUME CS:CODE, DS:CODE
    
    MOV BX, 0F015h
    MOV DX, A+4
    MOV AX, A+2
    DIV BX
    MOV Q+2, AX
    MOV AX, A
    DIV BX
    MOV Q, AX
    MOV R, DX
    
    HLT
    
    A DW 1536H, 4563H, 1234H
    Q DW ?, ?
    R DW ? 
               
CODE    ENDS  
        END