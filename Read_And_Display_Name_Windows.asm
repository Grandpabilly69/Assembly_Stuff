;Read and display name
;This would work in Windows
bits 64 
default rel

section .bss
	your_name resb 50 ; reserve 50 bytes for input

section .data
    read_name db "Enter your name: ", 0
    name_format db "%s", 10, 0  ; %s\n

section .text ;tells the kernel where the code actually begins
global main
extern ExitProcess
extern printf
extern scanf

main:
	
;Prompt Name
    sub rsp, 40             ; shadow space for Windows calling convention
    
	mov rdi, read_name
	xor eax, eax
    call printf
	
; read name
    mov rdi, name_format
    mov rsi, your_name
	xor eax, eax
    call scanf

; print name
    mov rdi, name_format
    mov rsi, your_name
	xor eax, eax
    call printf
	
	JMP EXIT_LABEL ; Goes to the Exit_Label Function
	

EXIT_LABEL:
	XOR rax, rax
CALL ExitProcess