CODE SEGMENT
    
    ASSUME CS:CODE, DS:CODE
      
    MOV AX, 1027H
    MOV BX, 5A27H
    MOV CX, 54A5H
    
    OR  AX, BX     ; AX = AX | BX
    
    XOR AX, CX     ; AX = AX ^ CX
    
    NOT AX         ; AX = ~AX
    
    TEST CX, BX    ; check flags, result not stored 
    
    AND CX, AX     ; CX = CX & AX
    
    HLT
    
CODE ENDS
     END



