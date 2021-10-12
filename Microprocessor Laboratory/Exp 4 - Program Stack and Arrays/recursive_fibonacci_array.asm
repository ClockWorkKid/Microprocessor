; code for fibonacci series generation using recursive procedure

CODE SEGMENT
    ASSUME CS:CODE, DS:CODE  
    
    ; ----------------------- MAIN ----------------------- ;
    
    XOR AX, AX  ; AX used as temp to store previous f2
    MOV BX, 2   ; BX used as index for byte array
    MOV CX, 0   ; used to store new f1
    MOV DX, 1   ; new f2
    
    CALL FIB
    
    HLT
    
    ; ----------------------- DATA ----------------------- ;
        
    n   DW 14   ; variable indicating array length

    ARR DB 0, 1, 12 DUP(0)  ; byte array to store fibonacci 
     
     
    ; ----------------------- PROC ----------------------- ;
    
    FIB PROC
        
        MOV AL, DL          ; temp = f2
        ADD DL, CL          ; f2 = f1 + f2
        MOV CL, AL          ; f1 = f2
        
        MOV ARR[BX], DL     ; store new f2 in array
        INC BX              ; increase array index
        CMP BX, n           ; check if time to return         
        
        JE DONE             ; return if done
        CALL FIB            ; else call again
           
        DONE:
        RET
        
    FIB ENDP
    
CODE ENDS
END




