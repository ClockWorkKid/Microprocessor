CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
          
        MOV CL, 03H     ; number of bits to be rotated   
          
            
        ; Rotate

        MOV AX, 082F3H  
        ROR AX, CL      ; rotate right  
        
        MOV AX, 0F0FH  
        ROL AX, CL      ; rotate left
            
            
        ; Rotate through carry
        
        MOV AX, 0F0F0H  
        RCR AX, CL      ; rotate through carry right      
        
        MOV AX, 0F0FH  ; rotate through carry left
        RCL AX, CL            
        

                  
CODE    ENDS  
        END
        