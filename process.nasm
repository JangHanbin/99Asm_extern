SECTION .DATA

info : db "Enter number what do you want to do : ",0x0A,0x00
infoLen : equ $-info
formatIn : db "%d",0
formatOut : db "%s",10,0

first : dd '2',0
second : dd '2',0
result : db '0',0 
multi : db '*',0
equal : db '=',0

test : db "Test",0x0A
testLen : equ $-test

answer : dd '0',0 
answerLen : equ $-answer

SECTION .TEXT
	GLOBAL _start
	EXTERN scanf
	EXTERN printf

_start : 
	call print_info
	
	call print_first
	call print_mul
	call print_second
	call print_equal
	mov esi, [first]
	sub esi,DWORD '0'
	mov edi, [second]
	sub edi,DWORD '0'
	mov eax ,esi
	mul edi
	mov DWORD [result], eax
	call print_result
	xor eax,eax	
;	push answer
;	push formatIn
;	call scanf

	call _end	

print_first : 
	mov eax, 4
	mov ebx, 1
	mov ecx,first 
	mov edx, 4
	int 0x80
	ret

print_mul : 
	mov eax, 4
	mov ebx, 1
	mov ecx, multi
	mov edx, 1
	int 0x80
	ret

print_second : 
	mov eax, 4
	mov ebx, 1
	mov ecx, second
	mov edx,4
	int 0x80
	ret

print_equal : 
	mov eax,4
	mov ebx,1
	mov ecx, equal
	mov edx,1
	int 0x80
	ret

print_result : 
	mov eax,4
	mov ebx,1
	mov ecx, result
	mov edx,2
	int 0x80
	ret
		
print_info : 

	mov eax, 4
	mov ebx, 1 ; file descriptor 
	mov ecx, info
	mov edx, infoLen
	int 0x80	; print info 
	ret


_end :
	mov eax, 1 ; exit system call number
	mov ebx, 0  ; exit with 0
	int 0x80 ; interrupt	
