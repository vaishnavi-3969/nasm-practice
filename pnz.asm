; check if no. is positive negative or zero

section .data
    msg_input db 'Enter no.: ', 10
    len_input equ $-msg_input
    msg_positive db "The no. is positive", 10
    len_positive equ $-msg_positive
    msg_negative db "The no. is negative", 10
    len_negative equ $-msg_negative
    msg_zero db "The no. is zero", 10
    len_zero equ $-msg_zero
    msg_invalid db "The no. is invalid", 10
    len_invalid equ $-msg_invalid
    
section .bss
    num resb 10
    
section .data
global _start
_start:
    ; displaying msg
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_input
    mov edx, len_input
    int 80h
    
    ; taking input
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 10
    int 80h
    
    ; performing operations
    mov eax, [num]
    
    cmp al, '+'
    je positive
    
    cmp al, '-'
    je negative
    
    cmp al, '0'
    je zero
    
    cmp al, '9'
    jae invalid
    
    positive: 
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_positive
        mov edx, len_positive
        int 80h
        jmp exit
        
    negative:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_negative
        mov edx, len_negative
        int 80h
        jmp exit
    
    zero:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_zero
        mov edx, len_zero
        int 80h
        jmp exit
        
    invalid:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_invalid
        mov edx, len_invalid
        int 80h 
        jmp exit
        
    exit:
        mov eax,1
        mov ebx, 0
        int 80h
