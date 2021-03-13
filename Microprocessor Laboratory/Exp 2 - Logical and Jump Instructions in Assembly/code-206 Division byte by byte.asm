; code downloaded from 
; https://microcontrollerslab.com/8086-integer-division-instructions-assembly-programming/

; BYTE WITH BYTE DIVISION

; In this case, the nominator and denominator operands are bytes. 
; The nominator resides in the AL register and AH is set to zero. 
; After division, the instruction stores quotient in AL and the 
; remainder in AH register.

ORG 100h 

.MODEL SMALL  

.DATA   

NUM_1 DB 0F2H
NUM_2 DB 4H  

.CODE   

MOV BH, NUM_2     ;Load numerator in BH  
MOV AL, NUM_1     ;Load denominator in AL
DIV BH            ;Divide BH by AL

RET             

; OUTPUT

; The DIV instruction divides BH by AL. F2 divided by 04 gives 
; quotient of 3C and give 02 as a remainder. AL stores the quotient
; and remainder is stored in AH register.

