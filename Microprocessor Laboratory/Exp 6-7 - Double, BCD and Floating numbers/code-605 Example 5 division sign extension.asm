CODE    SEGMENT
    
    ASSUME CS:CODE
    
    MOV AX, -4010D
    MOV BX, 7D
    PUSH AX
    
    ; CASE 1: DIVISION USING DIV
    
    XOR DX, DX
    DIV BX
    MOV Q_DIV, AX
    MOV R_DIV, DX
    
    ; CASE 2: DIVISION USING IDIV WITHOUT SIGN EXTENSION TO DX
    
    POP AX
    PUSH AX
    XOR DX, DX
    IDIV BX
    MOV Q_IDIV1, AX
    MOV R_IDIV1, DX
    
    ; CASE 3: DIVISION USING IDIV WITH SIGN EXTENSION TO DX
    
    POP AX
    CWD
    IDIV BX
    MOV Q_IDIV2, AX
    MOV R_IDIV2, DX
    
    HLT
    
    Q_DIV DW ?
    R_DIV DW ?
    
    Q_IDIV1 DW ?
    R_IDIV1 DW ?      
    
                    
CODE    ENDS  
        END