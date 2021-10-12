ORG 100H

.CODE

    MOV AX, 11D
    
    PUSH AX
    XOR DX, DX
    MOV BX, 2
    DIV BX
    MOV BX, AX
    
    POP AX
    
    MOV CX, 1
    
    PRIME_CHECKER:
    
        XOR DX, DX
        PUSH AX
        
        DIV BX
        POP AX
        
        CMP DX, 0
        
        JE NOT_PRIME
        DEC BX
        CMP BX, 1
        JE DONE
        JMP PRIME_CHECKER
            
    NOT_PRIME:
        MOV CX, 0
    
    DONE:
    
   
   
HLT