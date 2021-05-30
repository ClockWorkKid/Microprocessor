CODE    SEGMENT 
    
    ASSUME CS:CODE, DS:CODE   
     
    ; ######################## MAIN SECTION ######################## ;
    
    ; Person A
    
    LEA BX, A
    CALL PERCENTAGE_COUNTER
    MOV PERCENTAGE[0], AX
                
    ; Person B
    LEA BX, B
    CALL PERCENTAGE_COUNTER
    MOV PERCENTAGE[2], AX
    
    HLT  
    
      
    ; ######################## DATA SECTION ######################## ;
      
    A   DW 400D, 375D, 350D, 396D, 398D, 386D, 388D, 386D
    B   DW 336D, 340D, 370D, 350D, 330D, 354D, 356D, 363D
    
    PERCENTAGE  DW 0D, 0D
        
    n   DW 8    ; length
    n2  DW 16   ; length double    
    
    
    ; #################### FUNCTION DEFINITION #################### ;      
                   
    PERCENTAGE_COUNTER PROC 
                 
        XOR AX, AX
        XOR DX, DX
        XOR SI, SI

        ADDER:    ; add all the array elements         
            
            ADD AX, [BX+SI]
            ADD SI, 2
                     
            CMP SI, n2
            JNE ADDER
        
    MOV BX, n
    DIV BX        ; find average
    
    SUB AX, 375D
    JP case1
    
    case0: 
        MOV BX, 20D
        MUL BX
        ADD AX, 4400D     
        RET
    
    case1:
        MOV BX, 84D
        MUL BX
        ADD AX, 7900D    
        RET 
    
    PERCENTAGE_COUNTER ENDP
    

             
CODE    ENDS  
        END
        