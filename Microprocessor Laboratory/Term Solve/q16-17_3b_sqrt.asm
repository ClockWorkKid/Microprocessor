ORG 100h

.CODE

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
    
    
    
    
    
    






