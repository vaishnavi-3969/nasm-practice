section .data
    msg1 db "Enter the num1:", 0xa, 0xd
    len1 equ $-msg1
    msg2 db 'Enter the num2: ', 0xa, 0xd
    len2 equ $-msg2
    msg3 db 'Addition of no.: ',0xa,0xd
    len3 equ $-msg3
    msg4 db 'Subtraction of no.: ',0xa, 0xd
    len4 equ $-msg4
    msg5 db 'Multiplication of no.: ',0xa, 0xd
    len5 equ $-msg5
    msg6 db 'Division of no.: ',0xa, 0xd
    len6 equ $-msg6
    msg7 db "Result of OR operation: ", 0xa, 0xd
    len7 equ $-msg7
    msg8 db 'Result of AND operation: ', 0xa, 0xd
    len8 equ $-msg8
    msg9 db 'Result of XOR: ', 0xa, 0xd
    len9 equ $-msg9
    
    
segment .bss
    num1 resb 2
    num2 resb 2
    sum resb 1
    len equ $-sum
    subtract resb 1
    division resb 1
    multiply resb 1
    lenm equ $-sum
    result resb 1
    
section .text
    global _start
_start: 

    ; display msg to enter msg1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 80h
    
    ; accept string 1
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 80h
    
    ; display msg to enter str2
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h
    
    ; accept string 2
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 80h
    
    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    ; subtract to convert ascii to decimal
    sub ebx, '0'
    add eax, ebx
    ; convert decimal into ascii again
    add eax, '0'
    mov [sum], eax
    
    ; display msg of sum op
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 80h
    
    ; display sum op
    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, lenm
    int 80h
    
    mov eax, [num1]
    ; convert ascii to decimal
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'
    sub eax, ebx
    ; convert decimal to ascii
    add eax, '0'
    mov [subtract], eax
    
    ; dsiplay msg of sub op
    mov eax, 4
    mov ebx, 1
    mov ecx, subtract
    mov edx, 1
    int 80h
    
    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'
    mul ebx
    add eax,'0'
    mov [multiply], eax
    
    ; display msg of mul op
    mov eax, 4
    mov ebx, 1
    mov ecx, msg5
    mov edx, len5
    int 80h
    
    ; display mul op
    mov eax,4
    mov ebx,1
    mov ecx,multiply
    mov edx,1
    int 80h
    
    mov al,[num1]
    sub al,'0'
    mov bl,[num2]
    sub bl,'0'
    div bl
    
    add al,'0'
    mov [division],al
    
    ; display msg of div op
    mov eax, 4
    mov ebx, 1
    mov ecx, msg6
    mov edx, len6
    int 80h
    
    ; to display divi op
    mov eax,4
    mov ebx,1
    mov ecx,division
    mov edx,1
    int 80h

    ; display msg of op
    mov eax, 4
    mov ebx, 1
    mov ecx, msg7
    mov edx, len7
    int 80h
    
    mov eax,[num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    OR eax, ebx
    add eax,'0'
    mov [result], eax
    ; to display op
    
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 80h
    
    mov eax, [num1]
    mov ebx, [num2]
    and eax, ebx
    mov [result], eax
    
    ; to display msg of op
    mov eax, 4
    mov ebx, 1
    mov ecx, msg8
    mov edx, len8
    int 80h
    
    ; to display op
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 80h
    
    ; to display msg of op
    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, len9
    int 0x80
    
    mov eax,[num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    XOR eax,ebx
    add eax,'0'
    mov [result], eax
    
    ; to display op
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h