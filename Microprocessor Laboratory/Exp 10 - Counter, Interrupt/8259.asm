PROCED1 SEGMENT
RESET PROC FAR
ASSUME CS:PROCED1, DS:DATA
ORG 8000H
   PUSHF
   PUSH AX
   PUSH DX       
   XOR SI,SI
   POP DX
   POP AX
   POPF
   IRET
RESET ENDP
PROCED1 ENDS


PROCED2 SEGMENT
CONTINUE PROC FAR
ASSUME CS:PROCED2, DS:DATA
ORG 9000H
   PUSHF
   PUSH AX
   PUSH DX       
   INC SI
   CMP SI, 0AH
   JNE DALJE
   XOR SI,SI
   DALJE:
   POP DX
   POP AX
   POPF
   IRET
CONTINUE ENDP
PROCED2 ENDS



; DATA

DATA SEGMENT
ORG 0F000H
   PORTA EQU 00H
   PORTB EQU 02H
   PORTC EQU 04H
   PORT_CONFIG EQU 06H
   
   A_0 EQU 08H
   A_1 EQU 0AH
   
   seven_segment DB 11000000B
	 DB 11111001B
	 DB 10100100B
         DB 10110000B
         DB 10011001B
         DB 10010010B
         DB 10000010B
         DB 11011000B
         DB 10000000B
         DB 10010000B	
DATA ENDS

; STACK
STACK SEGMENT 
   BOS DW 64d DUP (?)
   TOS LABEL WORD
STACK ENDS


;MAIN CODE
CODE    SEGMENT PUBLIC 'CODE'
        ASSUME CS:CODE, DS:DATA, SS:STACK
      
	 ORG 0000H
START:
	 MOV AX, DATA
	 MOV DS, AX
	 MOV AX, STACK
	 MOV SS, AX
	 LEA SP, TOS
	 
	 ; Configuration
	 CLI
	 IN AL,00H
	 OUT 00H, AL 
	 
	 ;8255
	 MOV DX, PORT_CONFIG
	 MOV AL, 10000000B
	 OUT DX, AL
	 MOV DX, PORTA
	 MOV AL, 01H
	 OUT DX, AL
	 
	 ;8259
	 MOV DX, A_0 ;ICW1
	 MOV AL, 013H
	 OUT DX, AL
	 
	 MOV DX, A_1 
	 ;ICW2
	 MOV AL, 40H; Type declaration of IR0
	 OUT DX, AL
	 ;ICW4
	 MOV AL, 003H
	 OUT DX, AL
	 ;OCW1
	 MOV AL, 0CFH
	 OUT DX, AL
	 
	 ;Interrupt table init
	
	 MOV AX, OFFSET RESET
	 MOV [ES:110H], AX ; Address for IR0=40H*4=100H, So address of IR4=110H+10H (16D)= 110H
	 MOV AX, SEG RESET
	 MOV [ES:112H], AX ;Offset address will be from 110-111H, So segment adddress will be from 112-113H 

	 MOV AX, OFFSET CONTINUE ;Offset address for IR5 will be from 114-115H
	 MOV [ES:114H], AX
	 MOV AX, SEG CONTINUE
	 MOV [ES:116H], AX ; So segment adddress will be from 116-117H 
	 
	 ;Initial state
	 XOR SI, SI
	 MOV DX, PORTA
         MOV AL, seven_segment[SI]
         OUT DX, AL 
	 STI
L1:
	MOV AL, seven_segment[SI]
	MOV DX, PORTA
	OUT DX, AL
	
JMP L1
	
CODE    ENDS
END START