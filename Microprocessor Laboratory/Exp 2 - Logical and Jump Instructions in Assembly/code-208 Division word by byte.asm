; WORD BY WORD DIVISION

; In this case, the AX register holds the numerator. After 
; division, the quotient is stored in the AX register and the 
; remainder goes to the DX register.

ORG 100h 

.MODEL SMALL  

.DATA   

NUM_1 DW 0F213H   ; DW means Data Word
NUM_2 DW 41A8H       

.CODE   

MOV AX, NUM_1     ;Load numerator in AX  

DIV NUM_2         ;Divide AX by global variable NUM_2

RET             

; OUTPUT

; The output window shows that the division of F213H by 41A8 gives 
; the remainder of 2D1B (DX) and 03 as a quotient (AX).

