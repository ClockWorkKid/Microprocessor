; ADDITION OF TWO TWO-DIGIT NUMBERS
; C+2:C+1:C = A+1:A + B+1:B

CODE    SEGMENT
    
    ASSUME CS:CODE, DS:CODE
    
    XOR AH, AH
    MOV AL, A
    ADD AL, B
    AAA
    
    MOV C, AL
    MOV AL, AH
    ADD AL, A+1
    
    ADD AL, B+1
    MOV AH, 0
    AAA
    MOV C+1, AL
    MOV C+2, AH
    
    HLT
    
    A DB 7, 9 ; A = 97
    B DB 5, 6 ; B = 65
    C DB ?, ?, ?
               
CODE    ENDS  
        END