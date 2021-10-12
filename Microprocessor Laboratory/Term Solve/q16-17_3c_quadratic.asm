ORG 100h

.DATA 

    A DW 1D
    B DW -8D
    C DW 15D
    
    S1 DW 0
    S2 DW 0

.CODE
    
    MOV AX, B
    NEG AX
    
    PUSH AX
    
    MOV AX, B
    
    XOR DX, DX
    
    
    MOV BX, 400D
    
    CALL SQRT
        
    HLT
    
    
    SQRT PROC
    ; input BX
    ; output CX
        
        MOV CX, 0D 
    
        WHILE:
        
            INC CL  
            XOR AX, AX
            MOV AL, CL
            MUL AL
            CMP AX, BX
            JNG WHILE
            
        DEC CL 
    SQRT ENDP
    
    
    
    
    
    






