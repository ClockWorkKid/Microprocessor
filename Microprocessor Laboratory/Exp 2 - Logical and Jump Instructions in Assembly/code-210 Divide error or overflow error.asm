; DIVISION ERRORS

; The emulator would generate a type 0 interrupt if:

; In case of a byte with byte and word with byte division, 
; the quotient is greater than FFH.  

; In case of a word with word and doubleword by word division, 
; if the quotient is greater than FFFFH. 

; When the denominator is 0.

ORG 100h 

.MODEL SMALL  

.DATA   

NUM_1 DW 5BBDH   ; DW means Data Word 
NUM_2 DB 21H     ; DB means Data Byte 

.CODE   

MOV AX, NUM_1    ; Load numerator in AX

DIV NUM_2        ; Divide AX by global variable NUM_2

RET             

; OUTPUT

; In this case, the output window generates an error because 
; the quotient is 2C7 which is greater than the maximum limit 
; of the AL register. The AL register can only hold data up to FFH.

