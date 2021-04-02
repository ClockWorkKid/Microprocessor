; Perform division operation by shifting
; https://stackoverflow.com/questions/12697523/performing-bit-division-without-arithmetic-operators/12699549#12699549

CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
    ; *************************** MAIN *************************** ;
      
    CALL    DIVIDE
    
    HLT
    
    
    ; *************************** DATA *************************** ;
    
    x       DW 20     ; dividend
    y       DW 7      ; divisor   
    q       DW 0      ; quotient
    r       DW 0      ; remainder
                                  
    i       DW 8      ; loop counter                       
                           
    ; ************************ PROCEDURES ************************ ;
     
    ; NOT YET IMPLEMENTED
    
    DIVIDE  PROC      ; q, r : x/y
        
                
        MOV CX, i     ; loop to be executed 8 times
        
        WHILE:
        
            PUSH CX
            DEC  CX
            MOV  i, CX
            
            MOV AX, x
            MOV BX, y
            MOV CX, q
            MOV DX, r
            
            SHL CX, 1           ; quotient <<= 1
            SHL DX, 1           ; remainder <<= 1
            
            MOV q, CX
            MOV r, DX
            
            MOV CX, i
            
            MOV DX, 1
            SHL DX, CL          ; 1<<i
            
            AND AX, DX          ; dividend & [1<<i]
            SHR AX, CL          ; [dividend & [1<<i]] >> i
            
            MOV DX, r
            OR  DX, AX          ; remainder |= [dividend & [1<<i]] >> i 
            MOV r, DX
            
            CMP DX, BX          ; if remainder >= divisor
            JS continue
            
                SUB DX, BX
                MOV r, DX       ; remainder = remainder - divisor
                
                MOV CX, q
                OR  CX, 1
                MOV q, CX
            
            
            continue:
            
            POP CX
            LOOP WHILE
        
                
        RET      

    DIVIDE  ENDP              
    
                    
CODE    ENDS  
        END