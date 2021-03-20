CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
          
        MOV AX, 3256H
        MOV BX, 125AH
        PUSH AX
        
LEV:    SUB AX, BX
        CMP AX, BX
        JG  LEV
        MOV BX, AX
        POP AX  
        HLT

                  
CODE    ENDS  
        END
        