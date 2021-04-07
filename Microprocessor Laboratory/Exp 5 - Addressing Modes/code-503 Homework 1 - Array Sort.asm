CODE    SEGMENT 
    
    ASSUME CS:CODE, DS:CODE

    MOV CX, n
    MOV BX, 0
    
    WHILE_0:                ; copy elements of main array
    
        MOV AX, W[BX]
        MOV ASC[BX], AX
        ADD BX, 2
        LOOP WHILE_0
    
   
    MOV CX, n                   ; CX = n-1 at start of outer loop
    DEC CX
        
    WHILE_1:                    ; bubble sort in ascending order
         
         XOR AX, AX
         MOV j, AX              ; j = 0 at start of inner loop
         
         WHILE_2:
         
             MOV AX, j
             MOV BX, 2
             MUL BX
             MOV BX, AX
             
             MOV AX, ASC[BX]    
             ADD BX, 2
             CMP AX, ASC[BX]    ; comparing ASC[j] with ASC[j+1]
             
             JNG not_greater    ; ASC[j] !> ASC[j+1]
             
             XCHG AX, ASC[BX]
             SUB BX, 2
             MOV ASC[BX], AX    ; swap ASC[j], ASC[j+1]
             
             not_greater:
             
             MOV AX, j
             INC AX
             MOV j, AX          ; j = j+1 
             
             CMP AX, CX
             JNZ WHILE_2        ; loop if AX != CX
             
          LOOP WHILE_1
    
    
    MOV CX, n
    XOR BX, BX
    MOV AX, n
    MOV DX, 2
    MUL DX
    SUB AX, 2
    
    WHILE_3:                    ; store reverse of first array
            
        PUSH ASC[BX]
        XCHG AX, BX
        POP  DES[BX]
        XCHG AX, BX
        
        ADD  BX, 2 
        SUB  AX, 2
        
        LOOP WHILE_3    
    
        
    HLT     
    
    W   DW 4, 7, 5, 8, 3
    ASC DW 5 DUP(0)
    DES DW 5 DUP(0)
    
    j   DW 0                ; loop counter
    n   DW 5                ; array length
    
              
CODE    ENDS  
        END
        

