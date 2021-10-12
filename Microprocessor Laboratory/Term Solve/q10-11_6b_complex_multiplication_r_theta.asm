ORG 100H

.DATA

    A DB 6, 60  ; r, theta
    B DB 2, 30  ; r, theta
    M DB ?, ?
    D DB ?, ?
    
.CODE
    
    ; multiplication
    MOV AL, A
    MOV BL, B
    XOR AH, AH
    MUL BL
    MOV M, AL
    
    MOV AL, A+1
    MOV BL, B+1
    ADD AL, BL
    MOV M+1, AL
    
    ; division 
    MOV AL, A
    MOV BL, B
    XOR AH, AH
    DIV BL
    MOV D, AL
    
    MOV AL, A+1
    MOV BL, B+1
    SUB AL, BL
    MOV D+1, AL
    
HLT 
    
    