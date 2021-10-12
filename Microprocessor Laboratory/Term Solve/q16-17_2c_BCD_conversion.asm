; code for finding median of an array, the end of which is
; marked by '$'
             
ORG 100H
  
     
                 
; --------------------------- CODE --------------------------- ;

.CODE  
    
    ; ----------------------- MAIN ----------------------- ;
    
    MOV AX, 1355D
    XOR CX, CX
 
    XOR DX, DX 
    MOV BX, 1000D
    DIV BX
    
    ADD CX, AX
    MOV AX, DX  
    
    
    XOR DX, DX 
    MOV BX, 100D
    DIV BX
    
    SHL CX, 4
    ADD CX, AX
    MOV AX, DX
    
    
    XOR DX, DX 
    MOV BX, 10D
    DIV BX
    
    SHL CX, 4
    ADD CX, AX
    SHL CX, 4
    ADD CX, DX
    
    MOV AX, CX
    
    HLT
         

    




