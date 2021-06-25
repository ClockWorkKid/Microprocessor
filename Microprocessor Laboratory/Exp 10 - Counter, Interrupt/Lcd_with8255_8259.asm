;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		                                                                                      		;             																      ;
;		DESCRIPTION:                                                                          		;
;			This example demonstrates the interfacing of 8086 with 16x2 LCD display with interrupt 	;
;			Coding is done in a modular fashion to make the codes reusable. Each logical      	;
;			operation is performed using corresponding procedures. The input-output           	;
;			parameters are mentioned at the top of the procedure definitions.                 	;
;			                                                                                  	;
;		NOTE:                                                                                 		;
;			Here delay loop is implemented using LOOP instruction. If the loop iterates       	;
;			for 50 times, at 1Mhz clock frequency, this corresponds to 1ms. The delay         	;
;			loops in this code are set using this convention.                                 	;
;                                                                                             			;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ---------------------------------------- ISR ---------------------------------------- ;

PROCED1 SEGMENT
RESET PROC FAR
ASSUME CS:PROCED1, DS:DATA
ORG 8000H
   PUSHF
   PUSH AX
   PUSH DX    

   ; reset index to 0  
   XOR DI, DI
   
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

   ; Increment index or reset to 1  
   CMP DI, 05H
   JNE INCREMENT_IDX
   XOR DI, DI
   INCREMENT_IDX:
   INC DI
   
   POP DX
   POP AX
   POPF
   IRET
CONTINUE ENDP
PROCED2 ENDS

; ----------------------------------- DATA SEGMENT ----------------------------------- ;

DATA SEGMENT

   ORG 0F000H
   ; variables to keep track of port data
   PORTA_VAL DB 0
   PORTB_VAL DB 0
   PORTC_VAL DB 0
    
   ; sample string
   MYSTR	DB	"HELLO WORLD$"
   STR1		DB	"THIS IS A DEMO$"
   STR2		DB	"NICE TO MEET YOU$"
   
   NAME1	DB	"Himaddri Roy$"
   NAME2	DB	"Sayeed Mohammad$"
   NAME3	DB	"Sujoy Mondal$"
   NAME4	DB	"Ramit Dutta$"
   NAME5	DB	"Shafin Bin Hamid$"

   ROLL1	DB	"1606002$"
   ROLL2	DB	"1606003$"
   ROLL3	DB	"1606004$"
   ROLL4	DB	"1606006$"
   ROLL5	DB	"1606008$"
   
   IDX		DW	0H

   ; port addresses  
   PORTA EQU 00H 	; PORTA IS CONNECTED TO THE D7-D0
   PORTB EQU 02H 	; PORTB0 IS RW, PORTB1 IS RS, PORTB2 IS EN
   PORTC EQU 04H
   PCW   EQU 06H	; PORT FOR IO CONTROL
   
   A_0	 EQU 08H	; ADDRESS FOR INTERRUPT
   A_1   EQU 0AH
    
DATA ENDS


; ----------------------------------- STACK SEGMENT ----------------------------------- ;

STACK SEGMENT
   BOS DW 64D DUP (?)
   TOS LABEL WORD
STACK ENDS

; ----------------------------------- CODE SEGMENT ----------------------------------- ;

CODE SEGMENT PUBLIC 'CODE'

ASSUME CS:CODE,DS:DATA,ES:CODE,SS:STACK

ORG 0000h

START:

   ; set segment registers: 
   MOV AX, DATA
   MOV DS, AX
   MOV AX, STACK
   MOV SS, AX
   LEA SP, TOS
   ; MOV ES, AX  

   ; Configuration
   CLI			; clear interrupt
   IN AL, 00H
   OUT 00H, AL
   
   ; connect 8259
   CALL INTERRUPT_INIT	; Interrupt is setup here
   
   ; define IO ports
   MOV DX, PCW
   MOV AL, 10000000B   	; to make all ports output
   OUT DX, AL  
   
   CALL LCD_INIT	; LCD_INIT is called once at start of code	

   CALL ASSIGNMENT_2
   
   ; Infinite loop for debug purposes
   ; XOR SI, SI
   ; WHILE_FOREVER:
   ; JMP WHILE_FOREVER
   
   HLT


; ------------------------------------- PROCEDURES ------------------------------------- ;
ASSIGNMENT_2 PROC

   XOR DI, DI
   
   INTERRUPT_LOOP:
      
      CMP DI, IDX
      JE INTERRUPT_LOOP		; execute next steps if value changed
      
      CALL LCD_CLEAR 
      MOV IDX, DI
      MOV AX, DI

      CMP AX, 01H
      JE  PERSON1
      
      CMP AX, 02H
      JE  PERSON2
      
      CMP AX, 03H
      JE  PERSON3
      
      CMP AX, 04H
      JE  PERSON4
      
      CMP AX, 05H
      JE  PERSON5
	
      JMP INTERRUPT_LOOP	; will loop if index is any val other than 1-5
      
      PERSON1:
	 	 
	 MOV DL,1
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, NAME1
	 CALL LCD_PRINTSTR

	 MOV DL,2
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, ROLL1
	 CALL LCD_PRINTSTR
      
	 MOV CX, 60000
	 CALL DELAY
	 
	 JMP INTERRUPT_LOOP
	 
      PERSON2:
	 	 
	 MOV DL,1
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, NAME2
	 CALL LCD_PRINTSTR

	 MOV DL,2
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, ROLL2
	 CALL LCD_PRINTSTR
      
	 MOV CX, 60000
	 CALL DELAY
	 
	 JMP INTERRUPT_LOOP
	 
      PERSON3:
	 	 
	 MOV DL,1
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, NAME3
	 CALL LCD_PRINTSTR

	 MOV DL,2
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, ROLL3
	 CALL LCD_PRINTSTR
      
	 MOV CX, 60000
	 CALL DELAY
	 
	 JMP INTERRUPT_LOOP
	 
      PERSON4:
	 	 
	 MOV DL,1
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, NAME4
	 CALL LCD_PRINTSTR

	 MOV DL,2
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, ROLL4
	 CALL LCD_PRINTSTR
      
	 MOV CX, 60000
	 CALL DELAY
	 
	 JMP INTERRUPT_LOOP
	 
      PERSON5:
	 	 
	 MOV DL,1
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, NAME5
	 CALL LCD_PRINTSTR

	 MOV DL,2
	 MOV DH,1
	 CALL LCD_SET_CUR
	 LEA SI, ROLL5
	 CALL LCD_PRINTSTR
      
	 MOV CX, 60000
	 CALL DELAY
	 
	 JMP INTERRUPT_LOOP
      
   RET
ASSIGNMENT_2 ENDP


; Basic Delay function
DELAY PROC
; input: CX, this value controls the delay. CX=50 means 1ms
; output: none
   JCXZ @DELAY_END
   @DEL_LOOP:
   LOOP @DEL_LOOP	
   @DELAY_END:
   RET
DELAY ENDP

; Interrupt initialization - sets all the necessary stuff for 8259
INTERRUPT_INIT PROC
; input: none
; output: none

   ; ICW1
   MOV DX, A_0		
   MOV AL, 013H		; 0001 0011
   OUT DX, AL
   
   ; ICW2
   MOV DX, A_1		
   MOV AL, 040H		; Type declaration of IR0
   OUT DX, AL
   
   ; ICW4
   MOV AL, 03H		
   OUT DX, AL
   
   ; OCW1
   MOV AL, 0CFH
   OUT DX, AL
   
   ; Interrupt table initialization
   
   MOV AX, OFFSET RESET
   MOV [ES:110H], AX 		; Address for IR0=40H*4=100H, So address of IR4=110H+10H (16D)= 110H
   MOV AX, SEG RESET
   MOV [ES:112H], AX 		; Offset address will be from 110-111H, So segment adddress will be from 112-113H 

   MOV AX, OFFSET CONTINUE 	; Offset address for IR5 will be from 114-115H
   MOV [ES:114H], AX
   MOV AX, SEG CONTINUE
   MOV [ES:116H], AX 		; So segment adddress will be from 116-117H 
   
   STI
   
   RET

INTERRUPT_INIT ENDP

; LCD initialization, This is a basic procedure followed from the labsheet flowchart of initialization
LCD_INIT PROC 
; input: none
; output: none

   ; make RS=En=RW=0
   MOV AL, 0
   CALL OUT_B
   ; delay 20ms
   MOV CX, 1000
   CALL DELAY
   ;reset sequence
   MOV AH,30H
   CALL LCD_CMD
   MOV CX, 250
   CALL DELAY

   MOV AH,30H
   CALL LCD_CMD
   MOV CX,50
   CALL DELAY

   MOV AH,30H
   CALL LCD_CMD
   MOV CX,500
   CALL DELAY

   ;function set
   MOV AH,38H   ; setting interface length, 8 bit interface, 16*2 format, 5*7 charcter font
   CALL LCD_CMD

   MOV AH,0CH  ; Display on
   CALL LCD_CMD

   MOV AH,01H  ; Clear Display
   CALL LCD_CMD

   MOV AH,06H ; Entry mode set, I/D of cursor
   CALL LCD_CMD

   RET	
LCD_INIT ENDP 


; sends commands to LCD
LCD_CMD PROC
; input: AH = command code
; output: none

   ; save registers
   PUSH DX
   PUSH AX
   ; make rs=0
   MOV AL,PORTB_VAL
   AND AL,0FDH		;En-RS-RW
   CALL OUT_B
   ; set out data pins
   MOV AL,AH
   CALL OUT_A
   ; make En=1
   MOV AL,PORTB_VAL
   OR	AL,100B		;En-RS-RW
   CALL OUT_B
   ; delay 1ms
   MOV CX,50
   CALL DELAY
   ; make En=0
   MOV AL,PORTB_VAL
   AND AL,0FBH		;En-RS-RW
   CALL OUT_B
   ; delay 1ms
   MOV CX,50
   CALL DELAY
   ; restore registers
   POP AX
   POP DX	
   RET
LCD_CMD ENDP 


; clears the LCD
LCD_CLEAR PROC 
   MOV AH,1
   CALL LCD_CMD
   RET	
LCD_CLEAR ENDP 


; writes a character on current cursor position
LCD_WRITE_CHAR PROC 
; input: AH
; output: none

   ; save registers
   PUSH AX
   ; set RS=1
   MOV 	AL,PORTB_VAL
   OR	AL,10B		;EN-RS-RW
   CALL OUT_B
   ; set out the data pins
   MOV 	AL,AH
   CALL OUT_A
   ; set En=1
   MOV 	AL,PORTB_VAL
   OR	AL,100B		;EN-RS-RW
   CALL OUT_B
   ; delay 1ms
   MOV 	CX,50
   CALL DELAY
   ; set En=0
   MOV 	AL,PORTB_VAL
   AND	AL,0FBH		;EN-RS-RW
   CALL OUT_B
   ; return
   POP 	AX
   RET	
LCD_WRITE_CHAR ENDP
 

; prints a string on current cursor position
LCD_PRINTSTR PROC 
; input: SI=string address, string should end with '$'
; output: none

   ; save registers
   PUSH SI
   PUSH AX
   ; read and write character
   @LCD_PRINTSTR_LT:
      LODSB
      CMP AL,'$'
      JE @LCD_PRINTSTR_EXIT
      MOV AH,AL
      CALL LCD_WRITE_CHAR	
   JMP @LCD_PRINTSTR_LT

   ; return
   @LCD_PRINTSTR_EXIT:
   POP AX
   POP SI
   RET	
LCD_PRINTSTR ENDP 


; sets the cursor
LCD_SET_CUR PROC 
; input: DL=ROW, DH=COL
; 		DL = 1, means upper row
; 		DL = 2, means lower row
; 		DH = 1-8, 1st column is 1
; output: none

   ; save registers
   PUSH AX
   ; LCD uses 0 based column index
   DEC DH
   ; select case	
   CMP DL,1
   JE	@ROW1
   CMP DL,2
   JE	@ROW2
   JMP @LCD_SET_CUR_END

   ; if DL==1 then
   @ROW1:
   MOV AH,80H   ; address of the first col of first  row, D7=1 means DDRAM address, D6-D0 0 means address 0h
   JMP @LCD_SET_CUR_ENDCASE

   ;if DL==2 then
   @ROW2:
   MOV AH,0C0H  ; address of the first col of second row, D7=1 means DDRAM address, D6-D0 1000000 means address 40h (64d)
   JMP @LCD_SET_CUR_ENDCASE
	  
   ;execute the command
   @LCD_SET_CUR_ENDCASE:	
   ADD AH,DH
   CALL LCD_CMD

   ;exit from procedure
   @LCD_SET_CUR_END:
   POP AX
   RET
LCD_SET_CUR ENDP



LCD_SHOW_CUR PROC
; input: none
; output: none
   PUSH AX
   MOV AH,0FH
   CALL LCD_CMD
   POP AX
   RET
LCD_SHOW_CUR ENDP



LCD_HIDE_CUR PROC
; input: none
; output: none
   PUSH AX
   MOV AH,0CH
   CALL LCD_CMD
   POP AX
   RET
LCD_HIDE_CUR ENDP



; sends data to output port and saves them in a variable
OUT_A PROC 
; input: AL
; output: PORTA_VAL
   PUSH DX
   MOV DX,PORTA
   OUT DX,AL
   MOV PORTA_VAL,AL
   POP DX
   RET	
OUT_A ENDP


OUT_B PROC
;input: AL
; output: PORTB_VAL	
   PUSH DX
   MOV DX,PORTB
   OUT DX,AL
   MOV PORTB_VAL,AL
   POP DX
   RET
OUT_B ENDP

OUT_C PROC
; input: AL
; output: PORTC_VAL	
   PUSH DX
   MOV DX,PORTC
   OUT DX,AL
   MOV PORTC_VAL,AL
   POP DX
   RET
OUT_C ENDP 


CODE ENDS ; end of CODE segment
END START ; set entry point and stop the assembler.
