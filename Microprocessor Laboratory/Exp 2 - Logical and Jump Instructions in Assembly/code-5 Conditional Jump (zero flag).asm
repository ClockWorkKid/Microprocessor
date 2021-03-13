CODE SEGMENT
    
    ASSUME CS:CODE, DS:CODE
      
        MOV AX, 125BH
        MOV BX, 125BH
        MOV CX, 412AH
    
        SUB AX, BX      ; AX = AX - BX
    
        JZ  L3T2        ; jump to L3T2 line if (zero flag == 1) 
                        ; zero flag == 1 since AX - BX = 0
    
        ADD AX, BX      ; AX = AX + BX
    
L3T2:   AND AX, CX      ; AX = AX & CX 

        HLT
    

CODE ENDS
     END

