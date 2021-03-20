CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE

MAIN PROC
              
        MOV     AX, 123H
        MOV     BX, 16H
        CALL    MULTIPLY
        
        
MULTIPLY PROC
    
        PUSH    AX 
        PUSH    BX
        XOR     DX, DX
        
REPEAT:
        TEST    BX, 1
        JZ      END_IF
        ADD     DX, AX
END_IF: SHL     AX, 1
        SHR     BX, 1
        JNZ     REPEAT
        
        POP BX
        POP AX
        
        RET
        
MULTIPLY ENDP

        END MAIN
        
          
CODE    ENDS  
        END
        