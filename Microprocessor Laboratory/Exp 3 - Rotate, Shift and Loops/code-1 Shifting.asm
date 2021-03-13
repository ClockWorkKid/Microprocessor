CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
          
        MOV CL, 04H     ; number of bits to be shifted   
            
        ; logical shift
        ; appends zero when shifting either way, doesnt care for sign
        ; when a one passes out of the register, carry becomes 1

        MOV AX, 0F0F0H  
        SHR AX, CL      ; logical right shift  
        
        MOV AX, 0F0FH  
        SHL AX, CL      ; logical left shift
            
            
        ; arithmetic shift
        ; appends zero/one depending on number sign
        ; when a one passes out of the register, carry becomes 1
        
        MOV AX, 0F0F0H  
        SAR AX, CL      ; arithmetic right shift      
        
        MOV AX, 0F0F0H  ; arithmetic left shift
        SAL AX, CL            
        

                  
CODE    ENDS  
        END
        