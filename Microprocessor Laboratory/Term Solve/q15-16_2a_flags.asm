ORG 100h

.CODE

MOV AX, 0FFFFH
MOV BX, 8000H
MOV CX, 0002H 
MOV DX, 0FFFFH

ADD AX, BX
DEC BX
SUB BX, DX
NEG BX
INC BX
RCR BX, CL
SAR BX, CL





