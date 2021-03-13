; Suppose x = 20 and y = 28, add y with x for 30 times

CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
        
        
        ; ********** Main Sequence ********** ; 

        MOV     CX, n
        
        MOV     AX, x
        
adder:  ADD     AX, y
        LOOP    adder         
         
        MOV     ans, AX 
        
        HLT
              
           
        ; ********** Variables initialization ********** ;
           
        x DW 20D
        y DW 28D
        
        n DW 30D
        
        ans DW 0H
        
                 
CODE    ENDS  
        END
        