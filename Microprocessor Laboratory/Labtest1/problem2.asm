; ######################## MATRIX TRANSPOSE ######################## ;

CODE    SEGMENT 
    
    ASSUME CS:CODE, DS:CODE   
    
    ORG 100H 
     
    MOV CX, n
    XOR BX, BX

    WHILE_0:             

         
        XOR SI, SI
               
        
        WHILE_1: 
                
            
            MOV AX, CX
            DEC AX 
            MOV BX, n 
            MUL BX
            ADD AX, SI
            MOV BX, AX
             
            MOV DL, A[BX]
            MOV tmp, DL 
            
            MOV AX, SI 
            MOV BX, n 
            MUL BX
            ADD AX, CX
            DEC AX
            MOV BX, AX 
            
            MOV DL, tmp
            MOV B[BX], DL 
                
            INC SI
            CMP SI, n
            JNE WHILE_1    
                
                
        LOOP WHILE_0
    
     
            
    HLT
    
    A   DB  1,  2,  3
        DB  4,  5,  6
        DB  7,  8,  9
     
    B   DB  0,  0,  0
        DB  0,  0,  0
        DB  0,  0,  0   
        
    n   DW 3    ; matrix dimension
    i   DW 0    ; outer loop index
    
    tmp DB 0

           
CODE    ENDS  
        END
        