CODE SEGMENT
    
    ASSUME CS:CODE, DS:CODE
      
        MOV AX, 3254H
        MOV BX, 1F4BH
        MOV CX, 412AH
    
        ADD AX, CX      ; AX = AX + CX
    
        JMP L3T2        ; unconditional jump to L3T2 line 
    
        SUB AX, BX      ; AX = AX - BX
    
L3T2:   AND AX, BX      ; AX = AX & BX 
    

CODE ENDS
     END



; Final result is AX = (3254H + 412AH) & 1F4BH