CODE    SEGMENT 
    
    ASSUME CS:CODE, DS:CODE
     
    ORG 100H
    
    MOV CX, n
    XOR BX, BX
    
    MOV i, BX
    
    WHILE_0:
        
        PUSH CX
        MOV CX, n
         
        XOR SI, SI
        XOR AL, AL
        MOV idx, SI
        
        WHILE_1:
        
            CMP W[BX+SI], AL
            JNG continue_1
            MOV AL, W[BX+SI]
            MOV idx, SI
            continue_1:
            INC SI
            LOOP WHILE_1
            
        POP CX 
            
        MOV SI, idx
        XCHG AL, W[BX+SI]
        MOV SI, i
        XCHG AL, W[BX+SI]
        MOV SI, idx
        XCHG AL, W[BX+SI]
        
        MOV AX, i
        INC AX
        MOV i, AX    
        ADD BX, n
        
        LOOP WHILE_0

    HLT     
    
    ;W   DB  5,  10, 15, 50  ; square matrix data
    ;    DB  40, 13, 12, 11
    ;    DB  1,  10,  3,  2
    ;    DB  8,  10, 50,  11   
        
    W   DB  2,  4,  6
        DB  5,  3,  -2
        DB  1,  5,  7
       
    n   DW  3               ; square matrix dimension
    i   DW  0               ; outer loop index
    
    idx DW  0               ; maximum value index
              
CODE    ENDS  
        END
        

