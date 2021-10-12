; code for finding median of an array, the end of which is
; marked by '$'
             
ORG 100H
   
; --------------------------- DATA --------------------------- ;

.DATA  

    ARR DB 18D, 16D, 14D, 12D, 10D, 8D, 6D, 2D, '$'  ; byte array 
    



; --------------------------- STACK -------------------------- ;

.STACK

   BOS DW 64d DUP (?)
   TOS LABEL WORD
   
     
              
                 
; --------------------------- CODE --------------------------- ;

.CODE  
    
    ; ----------------------- MAIN ----------------------- ;
    
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    CALL LEN 
    CALL SORT  
    CALL MEDIAN
    
    HLT
     
    ; ----------------------- PROC ----------------------- ;
    
    LEN PROC    ; input: none output: AX (length of array)  
              
        CLD
        MOV AL, '$'
        LEA SI, ARR
        LEA DI, ARR
        
        LEN_LOOP:
            
            SCASB
            JNE LEN_LOOP   
        
        MOV AX, DI
        SUB AX, SI
        DEC AX
        
        RET
        
    LEN ENDP
    
    ; Bubble sort
    SORT PROC   ; input: AX (length of array) output: none
        
        MOV CX, AX
        DEC CX
        
        LOOP1: 
            PUSH CX
            LEA SI, ARR   
            
            LOOP2:
                MOV BL, [SI]
                CMP BL, [SI+1]
                JNG CONTINUE
                
                XCHG BL, [SI+1]
                MOV [SI], BL

                CONTINUE:
                INC SI
                LOOP LOOP2
                
            POP CX
            LOOP LOOP1
             
        RET
        
    SORT ENDP   
     
 
    MEDIAN PROC     ; input: AX (length of array) output: AX (median)
        
        MOV BX, AX
        XOR AX, AX
        LEA SI, ARR
        
        SHR BX, 1   ; divide by 2
        JNC EVEN    ; does not have carry
        
        ODD:
            
            MOV AL, [SI + BX]
            JMP DONE
            
        EVEN:
            MOV AL, [SI + BX - 1]  ; 1st value
            ADD AL, [SI + BX]      ; add 2nd value
            SHR AL, 1   ; divide by 2
        
        DONE:
        RET
        
    MEDIAN ENDP
    




