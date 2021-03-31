CODE    SEGMENT
    ASSUME CS:CODE, DS:CODE
                
    ; sets up an array of 10 words, with each initialized by 9
    ; Here we shall copy W to Z and set W[N] = 0 for N = 0 to 9
    
        ORG     100H
        MOV     CX, 10
        MOV     DI, 0           ; N=0
        
Zero:   
        MOV     AL, [W+DI]
        MOV     [Z+DI], AL
        MOV     [W+DI], 0       ; W[N]=0
        ADD     DI, 2           ; N=N+1
        DEC     CX
        JNZ     Zero
        HLT
        
        ORG     150H
W       DB      10      10 DUP(9)  ; Creates an array of 10 words initialized by 9 each
                                ; DUP means duplicate
Z       DB      10      DUP(?)  ; Creates an uninitialized array  

SOME    DB      10      3, 2 DUP (5, 6, 2 DUP(4)), 8

CODE    ENDS
        END