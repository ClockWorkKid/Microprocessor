; Factorial code

           
CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        
        MOV AX, 01H
        MOV CX, x
                
        
factorial:  

        MUL CX
        loop factorial
           
                       
last:   MOV x_factorial, AX
        HLT
        
        x           DW 5D  
        x_factorial DW 0H  
             
CODE    ENDS  
        END
        