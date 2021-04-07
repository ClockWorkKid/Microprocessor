CODE    SEGMENT 
    
    ASSUME CS:CODE, DS:CODE

    
    MOV CX, 5
    MOV AX, W
    
    WHILE:
        
         
        XOR DX, DX      ; remainder to 0
        MOV BX, 10      
        DIV BX          ; Divide by 10
        
        MOV BX, CX
        DEC BX          ; array index
        
        MOV D[BX], DL  
        
        LOOP WHILE      ; Move remainder to array
    
     
    HLT     
    
    W  DW   1010111100000110B
    D  DB 5 DUP(0)

              
CODE    ENDS  
        END
        

