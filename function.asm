section	.text
	global _start      
_start:  
    push 21
    call times2
    
    mov ebx, eax
    mov eax,1
    int 80h
    
times2:
    push ebp
    mov ebp, esp
    
    mov eax,[ebp+8]
    add eax,eax
    mov esp,ebp
    mov eax,4
    mov ebx,1
    mov ecx,ebp
    mov edx,9
    
    int 80h
    pop ebp
    ret
	