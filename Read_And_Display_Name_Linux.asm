;Read and display name
;This would work in Linux not in Windows
bits 64 
default rel

section .bss
read_name resb 50 ; reserve 50 bytes for input


section .text
.global _start
.intel_syntax noprefix

_start:
	PUSH rbp
	MOV rbp, rsp
	SUB rsp, 32
	
	
	;sys Read rax = 0
	MOV rax, 0
	MOV rdi, 0
	LEA rsi, read_name
	MOV rdx, 50 ; set size of string to 50/ number of bytes too read
	SYSCALL
	
	;SYS Write
	MOV rax, 1
	MOV rdi, 1
	LEA rsi, read_name
	MOV rdx, 50
	SYSCALL
	
	;Sys Exit
	MOV rax, 60
	MOV rdi, 69
	SYSCALL
