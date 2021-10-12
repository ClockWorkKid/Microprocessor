ORG 100H

.DATA

    STR DB  'BaNgLaDeSh'
    N   DW  10
    
.CODE

    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    MOV CX, N
    LEA SI, STR
    LEA DI, STR
    CLD
    
    XOR AX, AX
    CASE_CONV:
            
        LODSB
        CMP AL, 59H
        JG UPPERCASE
        
        LOWERCASE:
        SUB AL, 40H
        ADD AL, 60H
        JMP CHANGE
        
        UPPERCASE:
        SUB AL, 60H
        ADD AL, 40H
        JMP CHANGE
                     
        CHANGE:
        STOSB
        
        LOOP CASE_CONV
        
    HLT             
        