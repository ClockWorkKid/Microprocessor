ORG 100H

.CODE

MOV AX, 49          ; number to be checked


MOV BX, 1
MOV CX, 3


SQR_CHECKER:
    ADD BX, CX
    ADD CX, 2
    
    CMP BX, AX
    JE  SQR         ; if equal then perfect sqaure
    JG  NSQR        ; if sum exceeds value then not
    JMP SQR_CHECKER ; else iterate
    
SQR:
    MOV DX, 1
    JMP DONE
    
NSQR:
    MOV DX, 0
    JMP DONE
    
DONE:

HLT