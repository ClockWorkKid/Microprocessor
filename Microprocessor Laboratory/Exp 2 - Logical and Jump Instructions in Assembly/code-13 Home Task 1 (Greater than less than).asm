; Write an assembly code that will determine whether a number is 
; greater than 5 or equal of less, and put 0 or 1 or 2 for the 
; conditions in DX.
        
             
CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        MOV AX, 06H    ; input number
    
        SUB AX, 05H
    
        JZ zero        ; if result was zero
        JS negative    ; if result was negative
        
        MOV DX, 00H    ; otherwise
        JMP last
        
zero:   MOV DX, 01H
        JMP last 
        
negative:
        MOV DX, 02H
        JMP last 
        
last:   HLT    
    
        
CODE    ENDS  
        END
        