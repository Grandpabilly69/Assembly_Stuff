bits 64
default rel
;times table program

    
section .data
    read_format db "Enter your number: %d", 0
    print_format db "The sum is: %lld", 10, 0 ; using %lld for long long integer
    count dq 0
    num dq 7 ;initializes num and count
    
section .text
global main
extern printf
extern scanf
extern ExitProcess
main:
    sub rsp, 40
    mov rax, [count] ;inittializes rax for multiplication
    
    jmp print_out ;first goes to print

loop_times:
    mov rax, [count] ;count -> rax
    
    cmp rax, 12 ;checkes to see if times table must stop at 12
    jge exit_label ; if so it will kill itself
    
    add rax, 1 ; increment rax
    mov [count], rax ; rax -> count to save count progress
    
    
    imul qword [num] ; rax = rax * num
    
    jmp print_out ; goes to print
    

print_out:
    lea rcx, [print_format] ;uses format
    
    mov rdx, rax ; moves rax -> rdx for printf function

    xor eax, eax
    call printf
    
    jmp loop_times ; goes to loop_times

exit_label: ; kills program
    xor eax, eax
    call ExitProcess