; Find the LCM of three given numbers (0Fh, 4Bh, 20Dh)

CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
        
        
        ; ********** LCM between num1 and num2 ********** ; 

        MOV AX, num1
        MOV BX, num2

        MUL BX        ; AX = AX*BX
        MOV tmp, AX   ; tmp = num1*num2
        MOV AX, num1
                  
GCD1:   XOR DX, DX    ; Set dividend to zero in start of each cycle
        DIV BX        ; Divide AX by BX, quotient saved to AX, dividend to DX      
        MOV AX, BX    ; AX = BX
        MOV BX, DX    ; BX = dividend
        CMP DX, 0H    ; check if dividend was 0
        JNZ GCD1      ; keep jumping until dividend is zero
                      ; result will be in AX register
         
        MOV BX, AX    ; GCD stored in BX
        MOV AX, tmp   ; AX = GCD * LCM
        DIV BX        ; AX will store LCM
        
        MOV lcm, AX   ; store current lcm in AX
        
        ; ********** LCM between LCM1 and num3 ********** ;               
        
        MOV BX, num3

        MUL BX        ; AX = lcm1 * num3
        MOV tmp, AX   ; tmp = lcm1 * num3
        MOV AX, lcm
                  
GCD2:   XOR DX, DX    ; Set dividend to zero in start of each cycle
        DIV BX        ; Divide AX by BX, quotient saved to AX, dividend to DX      
        MOV AX, BX    ; AX = BX
        MOV BX, DX    ; BX = dividend
        CMP DX, 0H    ; check if dividend was 0
        JNZ GCD2      ; keep jumping until dividend is zero
                      ; result will be in AX register
         
        MOV BX, AX    ; GCD stored in BX
        MOV AX, tmp   ; AX = GCD * LCM
        DIV BX        ; AX will store LCM
         
        MOV lcm, AX   ; store LCM in variable         
        
        
        HLT
              
           
        ; ********** Variables initialization ********** ;
           
        num1 DW 0FH
        num2 DW 4BH
        num3 DW 20DH 
        
        tmp DW 0H     ; temporary variable
        lcm DW 0H     ; result storage
        
                 
CODE    ENDS  
        END
        