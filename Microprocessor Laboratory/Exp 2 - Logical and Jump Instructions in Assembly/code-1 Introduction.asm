
;############################################################ 
;                        MOV
;############################################################ 

; MOV opcode copies data from right operand to first operand

MOV BX, 70H ; 70 in hexadecimal is loaded into BX register   
MOV CX, 40H ; 40 in hexadecimal is loaded into CX register


;############################################################
;                      AND OR XOR
;############################################################


; AND, OR, XOR opcode does logical operation on two operands 
; and stores result in the first operand. 

; TEST opcode does logical AND but does not store data

; all logical operations updates flag register values 


AND CX, BX  ; 70H AND 40H = 40H stored in CX register

OR  CX, BX

XOR CX, BX   


hlt


