; Write an assembly code to compute the product of the integers
; in AL & BL by add-and shift loop method. Put result in AX.
; You cannot use the MUL command.

           
CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        ; Loading Data
        
        MOV AL, num1
        MOV BL, num2
        
        MOV DL, AL  ; creating backup as AX will store result
        MOV CL, 8D  ; loop counter for multiplying 8 bits
        MOV AX, 0H  ; initialize result to 0
        
        
multiplier:  

        SHL AX, 01H ; adding a zero to right of result
        SHL BL, 01H ; shifting BL by one for MSB
              
        JNC skip    ; if MSB was 0, no operation              

        ADD AX, DX  ; if MSB was 1, add num1 bits to result
        
skip:   NOP

        loop multiplier ; loop the multiplier 16 times                          

                       
last:   HLT
        
        num1 DB 1BH  
        num2 DB 1CH  
        
             
CODE    ENDS  
        END
        