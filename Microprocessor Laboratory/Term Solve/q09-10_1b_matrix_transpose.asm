ORG 100H
 
.DATA

    A DB 1, 2, 3, 4, 5
      DB 6, 7, 8, 9, 10
      DB 11, 12, 13, 14, 15
      DB 16, 17, 18, 19, 20
      DB 21, 22, 23, 24, 25
      DB 26, 27, 28, 29, 30
      
    B DB 0, 0, 0, 0, 0, 0
      DB 0, 0, 0, 0, 0, 0
      DB 0, 0, 0, 0, 0, 0
      DB 0, 0, 0, 0, 0, 0
      DB 0, 0, 0, 0, 0, 0
      
    M DW 6  ; number of rows in A
    N DW 5  ; number of cols in A
    
    V DW 0
    
.CODE
    
    MOV AX, M
    MOV CX, N
    XOR DX, DX
    MUL CX
    MOV CX, AX
    DEC CX              ; CX = MN-1
    MOV V, CX           ; keep this value for future reference
    
    XOR SI, SI          ; index for A
    XOR BX, BX          ; index for B
   
    LOOPER:             ; loop for MN-1 times
        MOV DL, A[SI]
        MOV B[BX], DL   ; B[BX] <- A[SI]
        
        ; update A index
        INC SI          
        
        ; update B index
        ADD BX, M
        MOV AX, V
        XCHG AX, BX
        XOR DX, DX
        DIV BX
        MOV BX, DX      ; BX = (BX + M) MOD (MN-1)
        
        LOOP LOOPER
      
    MOV DL, A[SI]
    MOV B[SI], DL       ; copy the last value of matrix
        

   
HLT