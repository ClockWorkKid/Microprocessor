ORG 100H

.DATA

    MAT DB 3D, 1D, 1D, 0D
        DB 4D, 7D, 1D, 1D
        DB 7D, 8D, 20D, 1D
        DB 1D, 2D, 3D, 30D
        
    N DW 4
        

.CODE

    MOV AX, 1
    
    
    
    MOV CX, N       ; load row count
    XOR BX, BX      ; row offset
    XOR DI, DI      ; row index
    ROW_LOOP:
        PUSH CX
        
        MOV CX, N   ; load col count
        XOR SI, SI  ; col index
        XOR DX, DX  ; row sum
        COL_LOOP:
        
            CMP SI, DI
            JE DIAGONAL_ELEMENT
            
            ADD DL, MAT[BX+SI]  ; add if not diagonal element
            
            DIAGONAL_ELEMENT:
            INC SI
            LOOP COL_LOOP
            
        CMP MAT[BX+DI], DL
        JNGE NOT_DIAGONAL_MATRIX
        
        ADD BX, N   ; increase row offset
        INC DI    
        POP CX
        LOOP ROW_LOOP
        
    JMP DONE
    NOT_DIAGONAL_MATRIX:
    MOV AX, 0
    
    DONE:
    
    HLT
