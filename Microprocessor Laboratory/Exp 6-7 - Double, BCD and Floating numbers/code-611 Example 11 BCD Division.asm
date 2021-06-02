
CODE    SEGMENT
    
    ASSUME CS:CODE, DS:CODE
          
    ; OBSERVE THE EFFECTS OF AAM ON THE CONTENTS IN AX IN SINGLE STEP MODE
    MOV AX, 97H
    AAM
    
    MOV AX, 97D
    AAM
    
    MOV AX, 9804H
    AAM
    
    MOV AL, 9D
    MOV BL, 8D
    MUL BL
    AAM
    
    HLT
               
CODE    ENDS  
        END