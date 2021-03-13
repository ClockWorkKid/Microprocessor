; Consider a number 32h. Reverse its bit pattern and 
; count the number of 1s.
  
  
CODE SEGMENT
    ASSUME CS:CODE, DS:CODE
        
        MOV AX, 32H ; value under consideration
        MOV CX, 16D ; each register has 16 bits in total
                    ; we have to iterate through 16 bits


FLIP:
        CMP CX, 0H  ; quit loop if loop counter CX is 0
        JZ  LAST
        
        SHR AX, 01H ; logical shifting AX register to the right
                    ; produces carry of 1 if the value that
                    ; popped out of register was 1   
        DEC CX            
        JC  APPEND1
        JNC APPEND0 
        
                    
                    ; left shift DX and append 0 on right
APPEND0:
        SHL DX, 01H  
        JMP FLIP
        

APPEND1:            ; left shift DX and append 1 on right
        SHL DX, 01H 
        INC DX      
        INC BX      ; count the 1 in question
        JMP FLIP
        
LAST:            
        HLT
        
               
CODE ENDS
     END
     





