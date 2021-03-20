CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
                
        XOR     AL, AL      ; initialize to 0 
        XOR     BX, BX      ; initialize to 0
        MOV     CX, 3       ; 3 values to be added
            
ARRSUM:
        MOV     AL, W[BX]   ; BX is used as index
        ADD     SUM, AL     ; AL added to SUM in each loop 
        INC     BX          ; increment array index
        LOOP    ARRSUM
    
        HLT
    
        W       DB 1, 2, 5  ; Array containing data
        SUM     DW 0        ; Variable containing sum
        
         
CODE    ENDS  
        END
        