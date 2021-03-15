CODE SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        MOV AX, 7A24H
        MOV BX, 95A3H
        ADD AX, BX     
        JC L3T2         ; Jump to L3T2 if CF=1
        
EEE316: OR AX, 23H     
        JNZ Last        ; Jump to Last if previous operation not zero
        
L3T2:   MOV CX, 0FC7H
        SUB AX, CX
        TEST AX, BX
        JZ EEE316       ; Jump to EEE316 if previous operation zero
        
Last:   HLT  

CODE    ENDS
        END