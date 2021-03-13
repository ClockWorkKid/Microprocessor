CODE SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        MOV AX, 7A24H
        MOV BX, 15A3H
        
        SUB AX, BX      ; AX = 6481H after subtraction
        
        JMP L3T2
        
EEE316: DIV BX          ; Divide AX = 4481H by BX = 15A3H
                        ; Quotient AX = 0003H
                        ; Dividend DX = 0398H
        
        JMP Last
        
L3T2:   MOV CX, 45B1H

        AND AX, CX      ; AX = 4481H after AND
        
        TEST AX, BX
        
        JMP EEE316
        
Last:   HLT  

CODE    ENDS
        END