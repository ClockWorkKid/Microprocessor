ORG 100H

.DATA

    A DW 4, 1
      DW 7, 2
      
    B DW 2, -1
      DW -7, 4
      
    C DW 0, 0
      DW 0, 0
      
      
.CODE

    ;)
    MOV AX, A
    MOV BX, B
    IMUL BX
    PUSH AX
    MOV AX, A+2
    MOV BX, B+4
    IMUL BX
    POP BX
    ADD AX, BX
    MOV C, AX  
    
    ;)
    MOV AX, A
    MOV BX, B+2
    IMUL BX
    PUSH AX
    MOV AX, A+2
    MOV BX, B+6
    IMUL BX
    POP BX
    ADD AX, BX
    MOV C+2, AX
    
    ;)
    MOV AX, A+4
    MOV BX, B
    IMUL BX
    PUSH AX
    MOV AX, A+6
    MOV BX, B+4
    IMUL BX
    POP BX
    ADD AX, BX
    MOV C+4, AX
    
    ;)
    MOV AX, A+4
    MOV BX, B+2
    IMUL BX
    PUSH AX
    MOV AX, A+6
    MOV BX, B+6
    IMUL BX
    POP BX
    ADD AX, BX
    MOV C+6, AX
    
    CMP C, 1
    JNE NOTINVERSE
    CMP C+2, 0
    JNE NOTINVERSE
    CMP C+4, 0
    JNE NOTINVERSE
    CMP C+6, 1
    JNE NOTINVERSE
    
    INVERSE:
        MOV CX, 1
        JMP DONE
        
    NOTINVERSE:
        MOV CX, 0
        JMP DONE
        
    
        
    DONE:
HLT
    