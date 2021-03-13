;  Subtract 86B1H from 3F42H and store 0 in CX if overflow occurs 
; and 1 if no overflow occurs.
        
             
CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        MOV AX, 86B1H
        MOV BX, 3F42H
    
        SUB BX, AX
    
        JO OF           ; JMP if overflow     
        
        MOV CX, 01H     ; otherwise
        JMP last    
        
        
OF:     MOV CX, 0H
        JMP last
        
last:   HLT    
    
        
CODE    ENDS  
        END
        