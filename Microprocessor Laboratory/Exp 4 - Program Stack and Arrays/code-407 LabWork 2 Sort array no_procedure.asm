; Data did not work with procedures
; removed procedure and simply implemented loop 
; inefficient bubble sort

CODE    SEGMENT 
    
    ASSUME CS:CODE, DS:CODE
              

    OUTER_LOOP:             ; i = 0 at start of outer loop
    
        XOR AX, AX                      
        MOV j, AX           ; j=0 at start of each inner loop
        
        INNER_LOOP:  
        
            MOV BX, j
            
            MOV AL, W[BX]   ; AL = W[j]
            INC BX
            CMP AL, W[BX]
            JNG  NO_SWAP    ; jump if CX!<W[j+1] 
            
            XCHG AL, W[BX]  ; else, swap 
            DEC BX
            MOV W[BX], AL   ; W[j] = AL 
            
            NO_SWAP:
            
            MOV BX, j
            INC BX
            MOV j, BX       ; j = j+1
            
            CMP BX, 4       ; exit inner loop if j==4
            JNE INNER_LOOP
            
        MOV AX, i
        INC AX
        MOV i, AX           ; i = i+1
        
        CMP AX, 4
        JNE OUTER_LOOP      ; exit outer loop if i==4


    HLT
    
    W DB 8, 7, 6, 5, 4 
    i DW 0H
    j DW 0H
    
           
CODE    ENDS  
        END
        