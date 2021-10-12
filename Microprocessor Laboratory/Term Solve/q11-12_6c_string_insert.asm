ORG 100H

.DATA

    STRING1 DB 'PROGER        '
    STRING2 DB 'RAMM          '
    
    S1 DW 6
    S2 DW 4

.CODE

    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    
    MOV CX, 4   ; offset for insertion 
    
    ; ----------- MAIN ----------- ;
    
    LEA SI, STRING1
    ADD SI, S1  
    DEC SI      ; SI points to STRING1 endpoint
    
      
    LEA DI, STRING1
    ADD DI, S1
    ADD DI, S2
    DEC DI      ; DI points to where shifted bytes should end
    
     
    MOV AX, S1  ; load size of STRING1
    SUB AX, CX  ; bytes after insertion point
    XCHG AX, CX
    
    STD         ; set direction reverse
    REP MOVSB   ; shift the bytes after insertion index
    
    XCHG AX, CX
    
    LEA SI, STRING2
    LEA DI, STRING1
    ADD DI, CX  ; insertion index
    
    MOV CX, S2
    
    CLD         ; set direction forward
    REP MOVSB
    
HLT    
    




