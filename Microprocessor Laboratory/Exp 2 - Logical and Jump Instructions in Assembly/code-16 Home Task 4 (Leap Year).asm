; Write an assembly code that checks if a year is a leap year.
; Code template is shown below. If 'YEAR' is a leap year, put 1
; in 'LEAPYEAR'. Else put 0 in 'LEAPYEAR'. You may observe value of
; LEAPYEAR by pressing the "var" button, beside the "flag" button
        
             
CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        MOV AX, CS  ; these two lines are here to ensure DS==CS
        MOV DS, AX  ; Can be ignored in EMU but essential in hardware
               
        MOV AX, YEAR
        MOV DX, 0   ; be careful to put 0 in DX before using DIV in case of 16 bit operand
                    ; as DX:AX is dividend, if there is garbage value in DX, you'll get 
                    ; suspicious result   
                    
                        
                        
                        
        ; *************SOLUTION CODE HERE*************
        
        
        ; DIVIDE BY 400
        
        MOV CX, AX      ; creates a copy of the main year
        MOV BX, 0400D   ; to divide by 400 first
         
        DIV BX
        CMP DX, 0H      ; compare dividend with 0
        
        JZ  positive    ; leap year if divided by 400
          
          
        ; DIVIDE BY 100
         
        MOV AX, CX      ; restore value of AX 
        MOV DX, 0       ; making sure dividend 0
        MOV BX, 0100D   ; to divide by 100
        
        DIV BX
        CMP DX, 0H      ; compare dividend with 0 
        
        JZ  negative    ; not leap year if divided by 100
        
          
        ; DIVIDE BY 4
          
        MOV AX, CX      ; restore value of AX 
        MOV DX, 0       ; making sure dividend 0
        MOV BX, 04D     ; to divide by 4
        
        DIV BX
        CMP DX, 0H      ; compare dividend with 0 
        
        JZ  positive    ;leap year if divided by 4
        JNZ negative    ; not leap year
        
        
positive:  

        MOV LEAPYEAR, 01H  
        JMP terminate

negative:

        MOV LEAPYEAR, 0H
        JMP terminate  
        
terminate:
        
        ; ************** END OF SOLUTION *************  
        
                  
        
        HLT
        
        YEAR DW 2021D   ; DW = Data Word (16 bits)
        LEAPYEAR DB ?   ; DB = Data Byte (8 bits)
        
             
CODE    ENDS  
        END
        