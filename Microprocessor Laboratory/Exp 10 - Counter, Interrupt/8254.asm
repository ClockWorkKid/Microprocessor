

DATA SEGMENT
;variables to keep track of port data
CNT1 EQU 02H
CNTR EQU 06H
DATA ENDS



CODE SEGMENT

ASSUME CS:CODE,DS:DATA,ES:CODE,SS:CODE
START:

ORG 00h
; set segment registers: 
    MOV AX, DATA
    MOV DS, AX
    MOV ES, AX  
    
    MOV AL, 76H
    MOV DX,CNTR
    OUT DX, AL
    MOV AL, 0D0H
    MOV DX,CNT1
    OUT DX, AL
    MOV AL, 07H
    OUT DX, AL
    HLT


CODE ENDS ;end of CODE segment
END START ; set entry point and stop the assembler.
