; code downloaded from 
; https://microcontrollerslab.com/8086-integer-division-instructions-assembly-programming/


ORG 100h 
 
; ORG (abbr. for ORiGin) is an assembly directive (not an instruction). 
; It defines where the machine code (translated assembly program) is 
; to place in memory. As for ORG 100H this deals with 80x86 COM program format 
; (COMMAND) which consist of only one segment of max. 64k bytes. 100H says that 
; the machine code starts from address (offset) 100h in this segment, effective 
; address is CS:100H.

.MODEL SMALL  

; With .model tiny you get a program where CS, DS, and SS are all pointing to 
; the same 64KB of memory. The stack is placed in the highest region of this 64KB segment.

; With .model small you get a program where CS points to a segment of its own, 
; followed by the segment where DS and SS are pointing to. The stack is placed in the 
; highest region of the SS segment.

.DATA   
; A data segment is one of the sections of a program in an object file or in memory, 
; which contains the global variables and static variables that are initialized 
; by the programmer. It has a fixed size, since all of the data in this section is set 
; by the programmer before the program is loaded. However, it is not read-only, 
; since the values of the variables can be altered at runtime. This is in contrast 
; to the Rodata (constant, read-only data) section, as well as the code segment 
; (also known as text segment).

NUM_1 DB 0F2H
NUM_2 DB 4H  

.CODE  
; In computing, a code segment, also known as a text segment or simply as text,
; is a phrase used to refer to a portion of memory or of an object file that contains 
; executable instructions. It has a fixed size and is usually read-only. If the 
; text section is not read-only, then the particular architecture allows self-modifying code. 
; Read-only code is reentrant if it can be executed by more than one process at the same time. 
; As a memory region, a code segment resides in the lower parts of memory or at its very bottom,
; in order to prevent heap and stack overflows from overwriting it.   

MOV BH, NUM_2     ;Load numerator in BH  
MOV AL, NUM_1     ;Load denominator in AL
DIV BH            ;Divide BH by AL

RET             

    
