; Combination (nCr) code

           
CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        
        MOV AX, 01H
        MOV CX, n   ; CX == n
        MOV BX, n
        SUB BX, r   ; BX == n-r
                
        
step1:  ; n! / r! 

        MUL CX  
        DEC CX 
        CMP CX, r 
        JNZ step1
           
        MOV CX, BX
              
step2:  ; step1 / (n-r)!   

        DIV CX
        loop step2
                
                       
last:   MOV nCr, AX
        HLT
        
        n   DW 10D  
        r   DW 4D
        nCr DW 0H
  
             
CODE    ENDS  
        END
        