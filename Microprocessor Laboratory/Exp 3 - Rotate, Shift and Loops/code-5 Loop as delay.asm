CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
          
        MOV CX, 0100D     ; Default loop counter   
        MOV AX, 0H        ; Value to be counted   
        
LEV:    INC AX
        LOOP LEV          ; CX automatically reduces each time loop is called
                          ; LOOP quits when CX reaches 0 in a LOOP call
        HLT
          
                  
CODE    ENDS  
        END
        