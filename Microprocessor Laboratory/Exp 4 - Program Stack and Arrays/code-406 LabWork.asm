CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
                
        XOR     AX, AX      ; initialize to 0  
        XOR     BX, BX      ; initialize to 0
        MOV     CX, 3       ; 3 values to be added
            
ARRSUM:
        MOV     AL, W[BX]   ; BX is used as array index
        ADD     SUM, AX     ; AL added to SUM in each loop 
        INC     BX          ; increment array index 
                            ; use ADD BX, 2 for word array
        LOOP    ARRSUM
    
        HLT
    
        W       DB 1, 2, 5  ; Array containing byte data
        SUM     DW 0        ; Variable containing sum
        
         
CODE    ENDS  
        END
        