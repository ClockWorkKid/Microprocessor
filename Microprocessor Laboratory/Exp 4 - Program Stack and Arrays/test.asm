CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
    ; *************************** MAIN *************************** ;
      
    PUSH    values
    PUSH    values+2
    POP     y
    POP     x
    
                   
    HLT
    
    
    ; *************************** DATA *************************** ;
    
    values  DW 2, 5, 6, 8
    n       DW 4
    x       DW 0
    y       DW 0
    z       DW 0
    ANS     DW 0
    
     

        

                    
CODE    ENDS  
        END