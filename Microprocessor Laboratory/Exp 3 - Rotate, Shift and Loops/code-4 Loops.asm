CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
          
        MOV CL, 02H     ; number of bits to be rotated   
        MOV AX, 105AH   
        SHL AX, CL
        
        HLT
          
                  
CODE    ENDS  
        END
        