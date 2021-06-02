CODE    SEGMENT
    
    ASSUME CS:CODE
    
    MOV AX, 0F056H
    PUSH AX
    
    ; MULTIPLICATION USING MUL
    
    XOR DX, DX
    MUL AX           
    MOV SQ_MUL, DX
    MOV SQ_MUL+2, AX
    
    ; MULTIPLICATION USING IMUL
    
    POP AX
    XOR DX, DX
    IMUL AX       
    MOV SQ_IMUL, DX
    MOV SQ_IMUL+2, AX
    
    HLT
    
    SQ_MUL DW ?, ?
    SQ_IMUL DW ?, ?        
    
                    
CODE    ENDS  
        END