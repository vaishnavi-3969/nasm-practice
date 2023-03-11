section .data
    addr db "Yellow"
    
section .text
global  _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx, addr
    mov edx, 6
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h
    