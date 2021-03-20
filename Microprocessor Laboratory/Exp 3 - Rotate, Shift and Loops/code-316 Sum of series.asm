; sum of n^2 series

           
CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        MOV BX, 0H  ; 
        MOV CX, n   ; CX == n
           
sumOseries: 

        MOV AX, CX
        MUL CX  
        ADD BX, AX
         
        loop sumOseries
           
        MOV CX, BX
                      
last:   MOV sum, BX
        HLT
        
        n   DW 8D  
        sum DW 0H
   
CODE    ENDS  
        END
        