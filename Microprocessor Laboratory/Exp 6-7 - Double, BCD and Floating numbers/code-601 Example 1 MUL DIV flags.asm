CODE    SEGMENT
    
    ASSUME CS:CODE
    
    ; MULTIPLICATION IN WORD FORM
    
    MOV AX, 23H
    MOV BX, 25H
    XOR DX, DX
    MUL BX      ; CHECK THE CARRY FLAG, OVERFLOW AND ZERO FLAG
    
    MOV AX, 0FFFEH
    MOV BX, 0FF06H
    MOV DX, 0
    MUL BX      ; CHECK THE CARRY FLAG, OVERFLOW AND ZERO FLAG
    
    ; MULTIPLICATION IN BYTE FORM
    
    MOV AL, 9H
    MOV BL, 5H
    XOR AH, AH
    MUL BL       ; CHECK THE CARRY FLAG, OVERFLOW AND ZERO FLAG
    
    MOV AL, 0FFH
    MOV BL, 0A6H
    MOV AH, 0
    MUL BL       ; CHECK THE CARRY FLAG, OVERFLOW AND ZERO FLAG
    
    ; DIVISION IN WORD FORM
    
    MOV DX, 0FFF4H
    MOV AX, 0FFA4H
    MOV CX, 0FFH
    DIV CX       ; CHECK THE CARRY FLAG, OVERFLOW AND ZERO FLAG
    
    ;DIVISION IN BYTE FORM  
    
    MOV AX, 0FAH
    DIV A        ; CHECK THE CARRY FLAG, OVERFLOW AND ZERO FLAG  
    
    HLT
    
    
    A DB 0FH         
    
                    
CODE    ENDS  
        END