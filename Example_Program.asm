; -- header --

bits 64 ; this says that we are using a 64-bit processor 
default rel ; this sets the default addressing to relative which is required for Linux and Windows x64



; -- variables --
; .bss means that what follows are variables that have not been intialised yet
section .bss
read_number resq 1 ; 64-bits integer = 8 bytes
;resq stands for reserve quadword 
;this just allocates space to the variable with no value assosiated



; -- Constants --
;These are Constants for the program  each has specific needs

section .data ; this refers to that the below is a set of constants
read_format db "%d", 0 ; the format for scanf

string_literal_0 db "Hello, world",10,0
;db stands for Data Byte which tells it to store what follows into individual bytes
;And the first thing is a declared memory location
;the string gets stored as an array of ascii values for each character
;the 10 that follows the string is ascii for newline and 0 is the null terminator



; -- Entry Point --

section .text ;tells the kernel where the code actually begins
global main
extern ExitProcess
extern printf
extern scanf
;extern means that the source files listed can be found in other object modules

main:
	PUSH rbp ;adds rbp register to the stack
	MOV rbp, rsp ; moves data from rsp and assigns it to rbp register
	SUB rsp, 32 ; subtracts 32 from rsp (rsp - 32)
	
; -- Read --
	LEA rcx, read_format ; stores the memory adress of read_format in rcx register
	LEA rdx, read_format ; does the same as above for rdx register
	XOR eax, eax ; compares bits if they are the ame it stores 0 in first register else stores 1
	CALL scanf ; basically reads from CLI input and in this case makes it a number
	PUSH qword [read_number] ; adds the memory address of read_number onto the stack  
	
; -- Read --
;this does the same as the above read
	LEA rcx, read_format
	LEA rdx, read_format
	XOR eax, eax
	CALL scanf
	PUSH qword [read_number]
	
; -- ADD --
	POP rax ; takes value at the top of the stack and assigns it to the rax register
	ADD qword [rsp], rax ; adds rax value to the 64 bit value in the stack and puts it back into the stack
	
; -- Print --
	LEA rcx, string_literal_0 ; stores the memory adress of string_literal_0 in rcx register
	XOR eax, eax ; makes eax = 0
	CALL printf ; displays to CLI (same as println)
	
; -- HALT --
	JMP EXIT_LABEL ; Goes to the Exit_Label Function
	
;this is the exit label function
EXIT_LABEL:
	XOR rax, rax ; makes rax = 0
CALL ExitProcess ; calls the exit process function stated at the top of program
; kills the program and tells where to stop