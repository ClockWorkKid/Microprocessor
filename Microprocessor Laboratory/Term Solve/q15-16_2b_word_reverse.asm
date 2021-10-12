ORG 100H

.DATA

    STRING1 DB 'this is a test'
    STRING2 DB '              '
    
    N DW 14
    
.CODE

    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX 
    XOR SI, SI
    MOV AL, ' '
    
    INVERTER:
    
        SPACE_CHECK:
            CMP AL, STRING1[SI]
            JE SPACE_CHECK_DONE
            INC SI 
            INC CX
            CMP SI, N
            JE SPACE_CHECK_DONE
            JMP SPACE_CHECK
            
        SPACE_CHECK_DONE:
        
        PUSH SI
        
        WORD_INV:
            MOV DL, STRING1[SI-1]
            MOV STRING2[BX], DL
            INC BX
            DEC SI
            LOOP WORD_INV
            
        
        POP SI
        
        CMP SI, N
        JE DONE
        
        MOV STRING2[BX], ' '
        INC BX
        INC SI
        
        JMP INVERTER
    
    DONE:
    HLT
        
        