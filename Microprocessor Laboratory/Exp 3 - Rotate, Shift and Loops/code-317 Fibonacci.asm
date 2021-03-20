; code for printing fibonacci series to console

           
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
        
print:  MOV DL, '0'
        ADD DL, 5D  
        MOV AH, 2
        int 21h  
        ret
        
        n   DW 8D
        x0  DW 0D
        x1  DW 1D  
        sum DW 0H
   
CODE    ENDS  
        END
                 
                 
                 




