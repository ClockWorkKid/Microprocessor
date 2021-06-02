
CODE    SEGMENT
    
    ASSUME CS:CODE, DS:CODE  
    
    ; ******************* MAIN ******************* ;
    
    MOV BX, B
    
    MOV AX, A
    MUL BX 
    MOV C, AX
    MOV C+2, DX
    
    MOV AX, A+2
    MUL BX
    ADD AX, C+2
    ADC DX, 0
    MOV C+2, AX
    MOV C+4, DX
    
    
    
    MOV BX, B+2
    
    MOV AX, A
    MUL BX 
    ADD AX, C+2
    ADC DX, C+4
    ADC CX, 0
    MOV C+2, AX
    MOV C+4, DX
    MOV C+6, CX
    
    MOV AX, A+2
    MUL BX
    ADD AX, C+4
    ADC DX, C+6
    MOV C+4, AX
    MOV C+6, DX
    
    HLT   
    
    ; ******************* DATA ******************* ;
    
    A DW 0BA98H, 0FEDCH
    B DW 03210H, 07654H
    C DW ?, ?, ?, ?
               
CODE    ENDS  
        END