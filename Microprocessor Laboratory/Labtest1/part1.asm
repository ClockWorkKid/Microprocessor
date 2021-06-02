; Fibonacci Recursive

CODE    SEGMENT 
    
    ASSUME CS:CODE, DS:CODE
    
    XOR AX, AX
    MOV BX, 2
    MOV CX, 0
    MOV DX, 1
    
    CALL FIB
    
    HLT
    
    n DW 8 
    ARR DB 0, 1, 0, 0, 0, 0, 0, 0
    
    
    FIB PROC 
        
        MOV AX, DX
        ADD DX, CX
        MOV CX, AX 
        
        MOV ARR[BX], DL
        
        INC BX
        CMP BX, n
        
        JE DONE
        CALL FIB       
        
        DONE:    
        RET 
        
    FIB ENDP  
    
           
CODE    ENDS  
        END
        