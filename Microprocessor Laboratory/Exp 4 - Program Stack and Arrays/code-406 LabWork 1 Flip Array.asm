CODE    SEGMENT 
    
    ASSUME CS:CODE, DS:CODE
              
    ; ############### MAIN SECTION ############### ;
    
    CALL FLIP
    HLT
    
    ; END OF MAIN
    
    
    ; ################### DATA ################### ;
    
    W DB 8, 7, 6, 5, 4      ; array to be flipped 
    i DW 0                  ; array first index 
    n DW 4                  ; array last index
    
    ; END OF DATA
    
    
    ; ########## PROCEDURES DEFINITION ########## ;
    
    FLIP PROC
        
        MOV AX, n
        INC AX
        MOV BX, 2 
        DIV BX
        MOV CX, AX          ; loop counter half of array length
        
        FLIPPER_LOOP:           
        
            XOR AX, AX      ; AX = 0
            
            MOV BX, i
            MOV AL, W[BX]   ; AL = W[i]
            
            MOV BX, n
            XCHG AL, W[BX]  ; W[n] <-> AL
            DEC BX
            MOV n, BX       ; n = n-1  
            
            MOV BX, i
            MOV W[BX], AL   ; W[i] = AL
            INC BX
            MOV i, BX       ; i = i+1
            
            LOOP FLIPPER_LOOP 

        RET
        
    FLIP ENDP 
    
    ; END OF PROCEDURES
    
           
CODE    ENDS  
        END
        