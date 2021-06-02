CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
    ; *************************** MAIN *************************** ;
      
    CALL    MEAN
    
    HLT
    
    
    ; *************************** DATA *************************** ;
                   
    ARR     DW 2, 4, 6, 8, 10, 12
    n       DW 6
    z       DW 0
    
    ; ************************ PROCEDURES ************************ ;
     
    MEAN    PROC        ; z = MEAN(arr)
        
        XOR AX, AX      ; zero init
        XOR BX, BX      ; array index
        MOV CX, n       ; loop counter
        
        ADDER:
            
            ADD AX, ARR[BX]     ; sum = sum + arr[i]
            ADD BX, 2           ; increment loop counter 
            
            LOOP ADDER  
          
        MOV CX, n
        DIV CX                  ; avg = sum / n
        MOV z, AX 
                
        RET      

    MEAN    ENDP              
    
                    
CODE    ENDS  
        END