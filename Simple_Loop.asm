bits 64
default rel

;Simple program that loops from 1 to 5 and displays the number each loop
section .bss
    number1 resq 1
    number2 resq 1
    answer resq 1
    
section .data
    read_format db "Enter your number: %d", 0
    print_format db "The sum is: %d", 10, 0
    count dq 0
    
section .text
global main
extern printf
extern scanf
extern ExitProcess

main:
    sub rsp, 40;standard setting rsp
    
    jmp loop_start;starts loop
  
loop_start:

    mov rax, [count] ;moves count -> rax
    
    cmp rax, 5 ; if rax >= 5
    jge exit_label ; if above true exit program
    
    add rax, 1 ; else add 1 -> rax
    mov [count], rax ; moves rax -> count
    
    jmp print_done ; goes to print function
    
print_done:
    lea rcx, [print_format]; loads format of print to rcx
    mov rdx, rax ; moves rax/count -> rdx
    xor eax, eax
    call printf ; prints count in good formating
    
    jmp loop_start ; goes back to loop 

exit_label:
    xor eax, eax
    call ExitProcess