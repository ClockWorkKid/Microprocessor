CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
    ; *************************** MAIN *************************** ;
      
    MOV     CX, n           ; loop counter = array length 
    
    PUSH    1
    POP     x               ; x = 1 (first LCM input)
    
    ITERATOR:
        
        MOV     BX, idx     ; array index
   
        PUSH    values[BX]  
        POP     y           ; y = values[idx]
        
        ADD     BX, 2       
        MOV     idx, BX     ; idx = idx+2
        
        CALL    LCM         ; z = LCM(x,y)
                                             
        PUSH    z
        POP     x           ; LCM output->input for next iter
        
        LOOP    ITERATOR
    
    PUSH    z
    POP     ANS             ; final answer 
    
    HLT
    
    
    ; *************************** DATA *************************** ;
    
    values  DW 2, 4, 5, 6, 8, 13
    n       DW 6      ; array length
    
    x       DW 0      ; function input 1
    y       DW 0      ; function input 2   
    z       DW 0      ; function output
    
    idx     DW 0      ; array index

    ANS     DW 0
    
     
    ; ************************ PROCEDURES ************************ ;
     
    LCM PROC          ; z = LCM(x,y)
                
        CALL GCD      ; z = GCD(x,y)
                
        MOV  AX, x     
        MOV  BX, y
        MUL  BX       ; AX = x*y
        
        MOV  BX, z
        DIV  BX       ; AX = x*y/GCD(x,y) 
        
        MOV  z, AX    ; LCM result stored in z from AX

        RET      

    LCM ENDP              
    
    
    GCD PROC          ; z = GCD(x,y)              
        
        MOV AX, x     
        MOV BX, y
        
        LEV:
                  
        XOR DX, DX    ; Set dividend to zero in start of each cycle
        DIV BX        ; Divide AX by BX, quotient saved to AX, 
                      ; dividend to DX      
        MOV AX, BX    ; AX = BX
        MOV BX, DX    ; BX = dividend
        
        CMP DX, 0H    ; check if dividend was 0
        
        JNZ LEV       ; keep jumping until dividend is zero
                      ; result will be in AX register
        
        MOV z, AX     ; GCD result stored in z from AX

        RET
       
    GCD ENDP
        

                    
CODE    ENDS  
        END