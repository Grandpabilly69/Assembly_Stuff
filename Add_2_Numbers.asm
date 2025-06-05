;This was built using SASM shout out gang
;this just adds 2 numbers together
; my only issue was that i cant seem to read any inputs
; thats why i put nums1 and 2 there with assigned values of 12 and 8
; these do add up to 20 
; but i am sad that it is not working properly
; more updates will be pushed at a later date
bits 64
default rel

section .bss
    number1 resq 1
    number2 resq 1
    answer resq 1

section .data
    read_format db "Enter your number: %d", 0
    print_format db "The sum is: %d", 10, 0
    nums1 dq 12
    nums2 dq 8

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

    ;Add numbers
    mov rax, [nums1]
    add rax, [nums2]
    mov [answer], rax
    
    ;print added numbers
    lea rcx, [print_format]
    mov rdx, [answer]
    xor eax, eax
    call printf
    
    
    jmp Exit_Label
    
Exit_Label:
    xor eax, eax
    call ExitProcess