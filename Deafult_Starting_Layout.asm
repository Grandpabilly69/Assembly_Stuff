bits 64
default rel

section .bss

section .data
    read_format db "Enter your number: %d", 0
    print_format db "The sum is: %lld", 10, 0 
    count dq 0
    num dq 7 ;
    
section .text
global main
extern printf
extern scanf
extern ExitProcess

main:
    sub rsp, 40
    


exit_label: ; kills program
    xor eax, eax
    call ExitProcess