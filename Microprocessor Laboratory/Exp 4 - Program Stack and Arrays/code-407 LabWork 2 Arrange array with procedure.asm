CODE    SEGMENT
    
    ASSUME CS:CODE, DS:CODE


MAIN PROC
              
    XOR CX, CX
    XOR DX, DX
              
    CALL    ARRANGE
       
        
ARRANGE PROC
    
    OUTER_LOOP:
    
        MOV AX, i
        MOV j, AX
        
        INNER_LOOP:  
        
            MOV BX, j
            MOV CL, W[BX]   ; CX == W[j]
            INC BX
            MOV DL, W[BX]   ; DX == W[j+1]
             
            MOV j, BX       ; j = j+1 
             
            CMP DL, CL
            JNG NO_SWAP     ; jump if CX!<DX 
            
            XCHG CL, DL     ; else, swap 
            
            NO_SWAP:
            
            MOV W[BX], DL   ; DX == W[j+1]
            DEC BX
            MOV W[BX], CL   ; CX == W[j]  
            
            CMP BX, 3
            JNE INNER_LOOP
            
        
        INC AX
        MOV i, AX
        
        CMP AX, 3
        JNE OUTER_LOOP

        
    RET
          
        
ARRANGE ENDP  

  HLT
  
  W DB 8, 5, 1, 7, 2 
    i DW 0H
    j DW 0H

        END MAIN
        
        
        
          
CODE    ENDS  
        END
        