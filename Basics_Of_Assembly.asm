;Basics of Assembly
;Arithmetic Operations
ADD 1,4  ;this adds 1 and 4 (basically 1+4) = 5

SUB 4,1  ; this subtracts 1 from 4 ( 4-1) = 3

MUL 2,3 ; this Multiplies numbers together (2 * 3) = 6

DIV 6,2 ; divides second number from first (6 / 2) = 3

;LOGIC 
;ALL the logic controls are similar/ the same to most languages
AND 
OR
XOR
NOT

;CONTROL
JMP LABEL ; this jumps to a certain point to where the label is listed
CMP ; this compares 2 values that are given
JE ; Jumps when equal to 
JNE ; Jumps when not equal

;DATA MOVE
MOV ; moves data from second register to first register
PUSH ; Saves value at the top of the stack
POP ; retrieves last value from the stack (AKA top of the stack)

;BIT manipulation
SHL ; shifts the bit registers left, which means that you are multiplying by 2
SHR ; same as SHL but you are basically dividing by 2
ROL ; Rotates bits left basically moving the most left bit to the most right
ROR ; same as ROL but goes the opposite way

;SYSCALL STuff

SYSCALL ;this is important, there are special operations that can be done with this.
;Look for a syscall table. it will tell you where to put certain values into registers 
;to preform certain operations
;THere are a few examples in Beginings.asm on syscalls