bits 64
default rel

;Note i am using nums1 and 2 because i cant seem to find the input area
;dont mind this, you can just do your thing the way u want
section .bss
    number1 resq 1
    number2 resq 1
    answer resq 1
    
section .data
    read_format db "Enter your number: %d", 0
    print_format db "The sum is: %d", 10, 0
    nums1 dq 123
    nums2 dq 100
    
section .text
global main
extern printf
extern scanf
extern ExitProcess

main:
    sub rsp, 40
    
    ;Read first number
    lea rcx, [read_format]
    lea rdx, [number1]
    
    xor eax, eax
    call scanf

    ;Read Second number
    lea rcx, [read_format]
    lea rdx, [number2]
    
    xor eax, eax
    call scanf
    
    ;Compares number 1 and number 2
    mov rax, [nums1]
    cmp rax, [nums2]
    jge num1_larger ;if num1 >= num2 then goes to num1_larger
    
    mov rax, [nums2]; else num2 > num1
    jmp print_answer


num1_larger:
    mov rax, [nums1]

print_answer:
    ;Print Answer
    lea rcx, [print_format]
    mov rdx, rax
    xor eax, eax
    call printf
    
    jmp exit_label

exit_label:
    xor eax, eax
    call ExitProcess
    
   