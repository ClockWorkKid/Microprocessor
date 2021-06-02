; MULTIPLICATION OF TWO NUMEBRS IN FLOATING POINT REPRESENTATION
; A = 8000 0000 0000H = 8x16^(C)
; B=0.0000 0000 00F0H = Fx16^(-B)
; C = AxB

CODE    SEGMENT
    
    ASSUME CS:CODE, DS:CODE
    
    MOV AX, A
    MUL B
    MOV C, AX
    
    MOV AX, A+2
    ADD AX, B+2
    MOV C+2, AX
    
    HLT 
    
    A DW 8H, 0CH        ; A = MANTISSA, A+2 = EXPONENT
    B DW 0FH, -0BH      ; B = MANTISSA, B+2 = EXPONENT
    c DW ?, ?           ; C = MANTISSA, C+2 = EXPONENT
               
CODE    ENDS  
        END