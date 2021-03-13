; Take input from keyboard until b is pressed

CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
        
        ; ********** Main Sequence ********** ; 

input:  MOV AH, 1H  ; keyboard input subprogram
        INT 21H
        
        CMP AX, character_b
        JNZ input   ; take input if AX != character_b
        
        HLT 
        
        character_b DW 0162H    ; hardcoded value
                      
CODE    ENDS  
        END
        