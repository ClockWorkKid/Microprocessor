CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
          
        MOV AX, 12H
        MOV BX, 25H
          
        MOV CX, AX    ; store a copy of AX
        MUL BX        ; AX = AX*BX
        MOV DX, AX    ; store a copy of result
        MOV AX, CX    ; retrieve original AX
        MOV CX, DX    ; CX = AX * BX
                  
                  
        ; FIND GCD
                  
LEV:    XOR DX, DX    ; Set dividend to zero in start of each cycle
        DIV BX        ; Divide AX by BX, quotient saved to AX, dividend to DX      
        MOV AX, BX    ; AX = BX
        MOV BX, DX    ; BX = dividend
        
        CMP DX, 0H    ; check if dividend was 0
        
        JNZ LEV       ; keep jumping until dividend is zero
                      ; result will be in AX register
        
         
        ; FIND LCM from GCD
         
        MOV BX, AX    ; GCD stored in BX
        MOV AX, CX    ; AX = GCD * LCM
        DIV BX        ; AX will store LCM
        
        HLT
          
                  
CODE    ENDS  
        END
        