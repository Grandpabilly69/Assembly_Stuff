.global _start
.intel_syntax noprefix

_start:
;SYSCALL to print hello world
;LEA is for Load Effective Adress 
;It basically says that we must assosiate the hello_world function to the rsi register
;In the syscall table, rax must be 1, rdi must be unsigned int, rsi must be string or const char*buf
;and rdx must be the size of the string
	MOV rax, 1
	MOV rdi, 1
	LEA rsi, [hello_world]
	MOV rdx, 14
	SYSCALL
;SYS_EXIT call 
;For exit rax must be 60 and rdi must be int error code
	MOV rax, 60
	MOV rdi, 69
	SYSCALL
	
hello_world:
	.asciz "Hello, World\n"