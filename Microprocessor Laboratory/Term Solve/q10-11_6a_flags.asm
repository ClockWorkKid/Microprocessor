ORG 100H

.CODE

XOR AX, AX
MOV BX, 0FFFFH
MOV CX, 8001H
XOR DX, DX

ADD AX, CX
ADD BX, AX
SUB BX, 1H
INC BL
NEG DX
DIV CX
TEST DX, DX



