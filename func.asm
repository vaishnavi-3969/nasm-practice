section	.text
	global _start      
_start:  
    call func
    call func
    call func
    call func
    mov eax,1
    mov ebx,0
    int 80h

func:
	mov ebp,esp
	sub esp,2
	mov [esp], byte 'H'
	mov [esp+1], byte 'i'
	mov eax,4
	mov ebx,1
	mov ecx,esp
	mov edx,2
	int 80h
	mov esp,ebp
	pop ebp
	ret
	