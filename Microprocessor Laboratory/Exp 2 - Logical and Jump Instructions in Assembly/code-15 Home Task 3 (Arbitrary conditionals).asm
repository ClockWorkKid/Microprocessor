; Take 2 arbitrary numbers x and y. If x>1000H perform x+y. If y<1000H
; perform x-y. If x>1000H and y<100H perform x = x'
        
             
CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
    
        MOV AX, 0250H
        MOV BX, 0050H
                    
        CMP AX, 1000H       ; Compares 1st val with 1000H
        
        JS  AX_les_1000     ; AX<1000
        JZ  AX_eql_1000     ; AX=1000
        JNS AX_grt_1000     ; AX>1000
        
        
AX_grt_1000:
        
        CMP BX, 100H        ; Compares 2nd val with 100H
        
        JS  AX_grt_1000_BX_les_100  ; AX > 1000 & BX < 100 
        JZ  AX_grt_1000_BX_eql_100  ; AX > 1000 & BX = 100
        JNS AX_grt_1000_BX_grt_100  ; AX > 1000 & BX > 100
       
        
AX_les_1000:
AX_eql_1000:

        CMP BX, 1000H       ; Compares 2nd val with 1000H
        
        JS  BX_les_1000     ; BX<1000
        JNS last            ; AX<=1000 & BX >=1000
        

; 1st CASE        
AX_grt_1000_BX_eql_100:
AX_grt_1000_BX_grt_100:

        ADD AX, BX
        JMP last              
        

; 2nd CASE        
BX_les_1000:
        
        SUB AX, BX
        JMP last
        
        
; 3rd CASE                
AX_grt_1000_BX_les_100:

        NOT AX
        JMP last  
                      

last:   HLT    
    
        
CODE    ENDS  
        END
        