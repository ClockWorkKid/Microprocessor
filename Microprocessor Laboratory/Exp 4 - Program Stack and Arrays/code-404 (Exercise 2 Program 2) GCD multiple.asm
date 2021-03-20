CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE

MAIN PROC
              
        MOV     AX, 9H
        MOV     BX, 5H
        MOV     CX, 4H
        MOV     DX, 3H
        
        CALL    GCD
        MOV     BX, CX
        XCHG    AX, BX
        CALL    GCD
        MOV     BX, DX
        XCHG    AX, BX
        CALL    GCD
        HLT
          
GCD     PROC
    
        PUSH    CX
        PUSH    DX
        MOV     DX, 0H
        
LEV:
        SUB     AX, BX
        CMP     AX, BX
        JG      LEV
        
        MOV     CX, AX
        MOV     AX, BX
        MOV     BX, CX
        CMP     BX, DX
        JNE     LEV
        POP     CX
        POP     DX
        
        RET
        
GCD     ENDP

        END MAIN
         
CODE    ENDS  
        END
        