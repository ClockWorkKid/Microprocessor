; DOUBLE WORD BY WORD DIVISION

; It is the last case of division in which a numerator is a 32-bit 
; number and a denominator is a 16-bit number. In this case, AX and 
; DX stores the numerator. The most significant part resides in the 
; DX register and the least significant bits of numerator are in the
; AX register.

; After the execution of DIV instruction, the remainder goes to DX 
; register and the quotient lie in AX register.

ORG 100h 

.MODEL SMALL  

.DATA   

NUM_1 DW 2413H   ; DW means Data Word  

.CODE   

MOV AX, 5670     ; Load lower bytes of numerator in AX
MOV DX, 4531     ; Load higher bytes of numerator in DX  

DIV NUM_1        ; Divide DX_AX by global variable NUM_1

RET             

; OUTPUT

; Here, the numerator in DX and AX which is 45315670 (decimal). 
; It is divided by 4531 to give quotient of 7D9A which is 
; in AX register.

