ORG 100H

.DATA

    CT DB 20, 19, 17, 16
    
.CODE

    MOV CX, 4
    XOR AX, AX
    LEA BX, CT
    
    ADDER:          ; add all the scores
    
        ADD AL, [BX]
        INC BX
        LOOP ADDER
    
    PUSH AX         ; store the sum
    
    MOV CX, 3
    MOV AL, CT
    LEA BX, CT
    
    
    LEAST_SCORE:    ; find the worst score
    INC BX
    CMP AL, [BX]
    JG  LESS
    LOOP LEAST_SCORE
    LESS: MOV AL, [BX]
    LOOP LEAST_SCORE
    
    MOV BL, AL
    POP AX
    SUB AL, BL      ; subtract the worst score
    
    XOR AH, AH
    MOV BL, 3
    DIV BL          ; find average                            
    
    CMP AH, 2       ; if remainder > 2, round up
    JL  DONE
    INC AL
    
    DONE:
    HLT
    
    
     
    