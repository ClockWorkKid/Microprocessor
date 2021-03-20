; Perform division operation by shifting

CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
    ; *************************** MAIN *************************** ;
      
    CALL    DIVIDE
    
    HLT
    
    
    ; *************************** DATA *************************** ;
    
    x       DW 13     ; dividend
    y       DW 3      ; divisor   
    q       DW 0      ; quotient
    r       DW 0      ; remainder
    
    ; ************************ PROCEDURES ************************ ;
     
    ; NOT YET IMPLEMENTED
    
    DIVIDE  PROC      ; q, r : x/y
        
        MOV AX, x
        MOV BX, y
        DIV BX
        
        MOV q, AX
        MOV r, DX
                
        RET      

    DIVIDE  ENDP              
    
                    
CODE    ENDS  
        END