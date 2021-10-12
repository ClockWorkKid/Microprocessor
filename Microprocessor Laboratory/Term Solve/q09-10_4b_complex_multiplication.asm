ORG 100H

.DATA

    Z1  DB  -2, 3
    Z2  DB  4, 5
    Z   DB  0, 0
    
.CODE
    
    ; real part
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    
    MOV AL, Z1
    MOV BL, Z2
    IMUL BL
    
    ADD CL, AL
    
    XOR AX, AX
    MOV AL, Z1+1
    MOV BL, Z2+1
    IMUL BL
    
    SUB CL, AL
    MOV Z, CL
                     
    ; imaginary part
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    
    MOV AL, Z1
    MOV BL, Z2+1
    IMUL BL
    
    ADD CL, AL
    
    XOR AX, AX
    MOV AL, Z1+1
    MOV BL, Z2
    IMUL BL
    
    ADD CL, AL
    MOV Z+1, CL
    
    HLT
     
                 