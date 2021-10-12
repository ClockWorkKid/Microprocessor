; code for finding median of an array, the end of which is
; marked by '$'
             
ORG 100H
   
; --------------------------- DATA --------------------------- ;

.DATA  

    ARR1 DB 'ABCDEFGHIJKLUNOPQRST'    
    ARR2 DB 'ABCDEFGHIJKLMNOPQRST' 
    
    N DW 20
    



; --------------------------- STACK -------------------------- ;

.STACK

   BOS DW 64d DUP (?)
   TOS LABEL WORD
   
     
              
                 
; --------------------------- CODE --------------------------- ;

.CODE  
    
    ; ----------------------- MAIN ----------------------- ;
    
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    LEA SI, ARR1
    LEA DI, ARR2
    
    MOV CX, N
    MOV AX, 1
    
    REPE CMPSB  
    
    JE DONE 
    
    MOV AX, 0
    DONE:

    HLT
     

    




