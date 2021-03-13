CODE SEGMENT
    
    ASSUME CS:CODE, DS:CODE
    
    MOV BX, 3256H
    MOV CX, 1554H
    AND CX, BX
    
    HLT
    
CODE ENDS
     END


; in this code, data is loaded into BX and CX registers
; CX = CX & BX
; program halts
