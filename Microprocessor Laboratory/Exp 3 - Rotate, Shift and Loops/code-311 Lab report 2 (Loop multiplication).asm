; Multiply 12 by 6 until result is below 3000H. If result is 
; greater than this, divide the result by 2 for 3 times

CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
        
        ; ********** Main Sequence ********** ; 

        MOV AX, 12D
        MOV BX, 6D 
        
multiplier:
        MUL BX
        CMP AX, 03000H
        JS  multiplier  ; jump to multiplier as long as AX < 3000H         
         
        MOV CX, 3D      ; loop counter init to 3
        MOV BX, 2D
        
divider:
        DIV BX
        LOOP divider
        
        HLT
                      
CODE    ENDS  
        END
        