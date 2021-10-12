.CODE

    MOV AX, 0FC80H 
    NEG AL            
    IMUL AH      
    RCR AL, 1    
    INC AX      
    ADD AL, 0FEH 