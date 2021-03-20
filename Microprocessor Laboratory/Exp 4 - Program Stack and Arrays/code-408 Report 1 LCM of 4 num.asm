CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
    ; *************************** MAIN *************************** ;
      
    MOV     AX, values
    MOV     BX, values+2
    
    CALL    LCM         ; call LCM procedure
    MOV     temp1, CX   ; store result
    
    MOV     AX, values+4
    MOV     BX, values+6
    
    CALL    LCM         ; call LCM procedure
    MOV     temp2, CX   ; store result
    
    MOV     AX, temp1
    MOV     BX, temp2
    
    CALL    LCM         ; call LCM procedure
    MOV     ANS, CX     ; store result                
    
    HLT
    
    
    ; *************************** DATA *************************** ;
    
    values  DW 2, 4, 6, 8
    n       DW 4
    temp1   DW 0
    temp2   DW 0
    ANS     DW 0
    
     
    ; ************************ PROCEDURES ************************ ;
     
    LCM PROC          ; LCM inputs AX and BX, output in CX
                
        CALL GCD
        
        PUSH AX       ; Backup AX
        MUL BX        ; AX = AX * BX
        DIV CX        ; LCM = AX * BX / GCD
        
        MOV CX, AX    ; CX stores result
        POP AX        ; Restore AX
        
        RET      

    LCM ENDP              
    
    
    GCD PROC          ; GCD inputs AX and BX, output in CX              
        
        PUSH AX       ; Backup AX
        PUSH BX       ; Backup BX
        
        LEV:
                  
        XOR DX, DX    ; Set dividend to zero in start of each cycle
        DIV BX        ; Divide AX by BX, quotient saved to AX, 
                      ; dividend to DX      
        MOV AX, BX    ; AX = BX
        MOV BX, DX    ; BX = dividend
        
        CMP DX, 0H    ; check if dividend was 0
        
        JNZ LEV       ; keep jumping until dividend is zero
                      ; result will be in AX register
        
        MOV CX, AX    ; CX stores result
        POP BX        ; Restore BX
        POP AX        ; Restore AX
        
        RET
       
    GCD ENDP
        

                    
CODE    ENDS  
        END