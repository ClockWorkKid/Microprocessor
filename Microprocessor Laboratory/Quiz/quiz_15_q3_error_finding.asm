;CODE ERRORS

MOV AX, ABDEH		; HEX character value starts with 0
MOV BX, B
MOV C, BX
DEC C			; cannot operate on variable ??
ADD B, C		; cannot operate on variable 
MOV AX, 1
PUSH AX

.LOOP1?
	MUL B		; MUL operand has to be register
	LOOP .LOOP1?	; also CX is kinda undefined

POP AL;			; POP works on 16 bit register not 8 bit
HLT

ORG 2000H
B DW ?
C DW ?, ?, ?