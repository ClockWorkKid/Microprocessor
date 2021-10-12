ORG 100H    
    
.DATA

    A DW 4321H, 8765H ; 087654321H
    B DW 0BCDAH
    C DW 0, 0, 0
    
.CODE

    MOV AX, A
    MOV BX, B
    XOR DX, DX
    
    MUL BX
    MOV C, AX
    MOV C+2, DX
    
    MOV AX, A+2
    XOR DX, DX
    
    MUL BX
    ADD AX, C+2
    ADC DX, 0
    
    MOV C+2, AX
    MOV C+4, DX
    
    HLT 